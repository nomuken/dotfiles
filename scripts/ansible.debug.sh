#!/bin/bash
export GIT_ROOT_PATH=$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)

ansible-playbook $GIT_ROOT_PATH/debug.yaml
