#!/bin/bash

set -a
source ".env"
set +a

#ansible-galaxy collection install cyberark.conjur

rm -rf "$CONJUR_CERT_FILE"

openssl s_client -connect "$CONJUR_MASTER_HOSTNAME":"$CONJUR_MASTER_PORT" \
  -showcerts </dev/null 2> /dev/null | \
  awk '/BEGIN CERTIFICATE/,/END CERTIFICATE/ {print $0}' \
  > "$CONJUR_CERT_FILE"

cat conjur-cloud-ca >> "$CONJUR_CERT_FILE"

ansible-playbook -i inventory playbook.yml
