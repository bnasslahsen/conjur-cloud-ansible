#!/bin/bash

set -a
source ".env"
set +a

envsubst < ansible-hosts.yml > ansible-hosts.yml.tmp
conjur policy update -f ansible-hosts.yml.tmp -b data/bnl/ansible-team | tee -a ansible-hosts.log
rm ansible-hosts.yml.tmp

conjur policy update -b data/vault/bnl-ansible-safe -f ansible-hosts-grants.yml