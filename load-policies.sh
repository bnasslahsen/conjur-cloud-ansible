#!/bin/bash

set -a
source ".env"
set +a

# Create Ansible Branch
conjur policy update -b data -f <(envsubst < ansible-branch.yml)
conjur policy update -b $APP_GROUP -f <(envsubst < ansible-hosts.yml)
conjur policy update -b data/vault/bnl-ansible-safe -f <(envsubst < ansible-hosts-grants.yml)


