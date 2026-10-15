"""Regression tests using the real Ansible role and Cask module with fake brew."""

import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class PackagesTest(unittest.TestCase):
    """Verify Cask policy without installing packages or accessing sudo."""

    def setUp(self):
        """Create an isolated Homebrew and Ansible workspace for each case."""
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.work = Path(self.temp.name)
        self.brew = self.work / 'brew'
        fixture = ROOT / 'tests/fixtures/brew.py'
        self.brew.write_text(f'#!{sys.executable}\n' + fixture.read_text())
        self.brew.chmod(0o755)
        self.state = self.work / 'state.json'
        self.state.write_text(json.dumps({
            'installed': ['parallels', 'firefox'],
            'outdated': ['parallels', 'firefox'],
            'failures': [],
        }))
        self.playbook = self.work / 'test.yaml'
        self.playbook.write_text(f'''
- hosts: localhost
  connection: local
  gather_facts: false
  vars_files:
    - {ROOT}/group_vars/macos.yaml
  vars:
    ansible_python_interpreter: "{{{{ ansible_playbook_python }}}}"
  module_defaults:
    community.general.homebrew_cask:
      path: {self.work}
  roles:
    - packages
''')

    def run_role(self, **overrides):
        """Run the production role with synthetic facts and an empty password."""
        variables = {
            'ansible_facts': {'os_family': 'Darwin'},
            'packages': [],
            'cask_packages': ['parallels', 'firefox'],
            'mac_password': '',
        }
        variables.update(overrides)
        variables_path = self.work / 'vars.json'
        variables_path.write_text(json.dumps(variables))
        binary = shutil.which('ansible-playbook')
        self.assertIsNotNone(binary, 'Install Ansible before running tests')
        result = subprocess.run(
            [binary, '-i', 'localhost,', str(self.playbook),
             '-e', f'@{variables_path}'],
            cwd=ROOT,
            env={
                'PATH': f'{self.work}:{Path(binary).parent}:{os.defpath}',
                'HOME': str(Path.home()),
                'ANSIBLE_HOME': str(self.work / 'ansible-home'),
                'ANSIBLE_CONFIG': str(ROOT / 'ansible.cfg'),
                'ANSIBLE_LOCAL_TEMP': str(self.work / 'local-tmp'),
                'ANSIBLE_REMOTE_TEMP': str(self.work / 'remote-tmp'),
                'ANSIBLE_ROLES_PATH': str(ROOT / 'roles'),
                'ANSIBLE_NOCOLOR': '1',
            },
            text=True, capture_output=True, timeout=60,
        )
        self.assertNotIn('[WARNING]', result.stderr)
        self.assertNotIn('[DEPRECATION WARNING]', result.stderr)
        return result

    def commands(self):
        """Return the commands sent to fake Homebrew by the real module."""
        log = self.work / 'commands.jsonl'
        return [json.loads(line) for line in log.read_text().splitlines()] if log.exists() else []

    def test_installed_parallels_is_preserved_and_other_casks_upgrade(self):
        """An outdated Parallels must survive; other Casks must still upgrade."""
        result = self.run_role()
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn(['upgrade', '--cask', 'firefox'], self.commands())
        self.assertNotIn(['upgrade', '--cask', 'parallels'], self.commands())
        self.assertNotIn(['outdated', '--cask', 'parallels'], self.commands())
        # A second application must make no changes, even with Parallels outdated.
        result = self.run_role()
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn('changed=0', result.stdout)

    def test_missing_parallels_is_installed(self):
        """A new machine must still receive Parallels on the first application."""
        state = json.loads(self.state.read_text())
        state['installed'].remove('parallels')
        self.state.write_text(json.dumps(state))
        result = self.run_role(cask_packages=['parallels'])
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn(['install', '--cask', 'parallels'], self.commands())

    def test_upgrade_failure_is_reported(self):
        """Errors from another Cask must fail the role instead of being hidden."""
        state = json.loads(self.state.read_text())
        state['failures'] = ['firefox']
        self.state.write_text(json.dumps(state))
        result = self.run_role(cask_packages=['firefox'])
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Simulated Homebrew failure', result.stdout + result.stderr)

    def test_install_failure_is_reported(self):
        """A failed first installation of Parallels must still fail the role."""
        self.state.write_text(json.dumps({
            'installed': [], 'outdated': [], 'failures': ['parallels'],
        }))
        result = self.run_role(cask_packages=['parallels'])
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Simulated Homebrew failure', result.stdout + result.stderr)

    def test_non_macos_skips_homebrew(self):
        """Linux facts must skip both Homebrew tasks without injected facts."""
        result = self.run_role(ansible_facts={'os_family': 'Debian'})
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.commands(), [])

    def test_empty_state_overrides_preserve_latest_default(self):
        """Without per-Cask overrides the existing latest policy must apply."""
        result = self.run_role(cask_packages=['firefox'], cask_package_states={})
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn(['upgrade', '--cask', 'firefox'], self.commands())


if __name__ == '__main__':
    unittest.main()
