#!/bin/bash

set -a
source ".env"
set +a

ansible-playbook -i inventory playbook.yml
