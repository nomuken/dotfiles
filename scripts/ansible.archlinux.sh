#!/bin/bash
GIT_ROOT_PATH=$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

ansible-playbook -i $GIT_ROOT_PATH/localhost.yaml $GIT_ROOT_PATH/archlinux.yaml
