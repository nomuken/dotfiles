.PHONY: apply-mac
apply-mac:
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