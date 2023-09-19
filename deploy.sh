#!/usr/bin/env bash
set -xe
set -o pipefail

virtualenv --python=3 venv
source venv/bin/activate
pip install -r requirements_webapp.txt

ansible-galaxy collection install -r requirements.yaml -p collections/ --force

./playbook.yaml -i inventory.yaml "$@"