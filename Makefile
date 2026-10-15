.PHONY: apply-mac
apply-mac:
	@ansible-galaxy collection install -r ./requirements.yaml
	@./scripts/ansible.macos.sh

.PHONY: apply-ubuntu
apply-ubuntu:
	@./scripts/ansible.ubuntu.sh

.PHONY: apply-archlinux
apply-archlinux:
	@./scripts/ansible.archlinux.sh

.PHONY: debug
debug:
	@./scripts/ansible.debug.sh

.PHONY: test
test:
	@python3 -m unittest discover -s tests -p 'test_*.py'
