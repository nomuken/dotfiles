"""Emulate Homebrew without changing installed applications."""

import json
import sys
from pathlib import Path


def main():
    """Record commands and simulate installation, upgrades, and failures."""
    root = Path(__file__).parent
    args = sys.argv[1:]
    with (root / 'commands.jsonl').open('a') as log:
        log.write(json.dumps(args) + '\n')
    state_path = root / 'state.json'
    state = json.loads(state_path.read_text())
    if args == ['--version']:
        print('Homebrew 5.0.0')
        return 0
    command, flag, name = args
    if flag != '--cask':
        raise ValueError(f'Unexpected arguments: {args}')
    if command == 'list':
        return 0 if name in state['installed'] else 1
    if command == 'outdated':
        if name in state['outdated']:
            print(name)
        return 0
    if command == 'upgrade' and name == 'parallels':
        print('pkill -TERM prl_client_app exited with 1', file=sys.stderr)
        return 1
    if name in state['failures']:
        print('Simulated Homebrew failure', file=sys.stderr)
        return 1
    if command not in ('install', 'upgrade'):
        raise ValueError(f'Unexpected command: {command}')
    state['installed'] = sorted(set(state['installed']) | {name})
    state['outdated'] = [item for item in state['outdated'] if item != name]
    state_path.write_text(json.dumps(state))
    print(f'{command}: {name}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
