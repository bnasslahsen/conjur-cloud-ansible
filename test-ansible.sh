#!/bin/bash

set -a
source ".env"
set +a

#ansible-galaxy collection install cyberark.conjur

openssl s_client -connect "$CONJUR_MASTER_HOSTNAME":"$CONJUR_MASTER_PORT" \
  -showcerts </dev/null 2> /dev/null | \
  awk '/BEGIN CERTIFICATE/,/END CERTIFICATE/ {print $0}' \
  > "$CONJUR_CERT_FILE"

cat "Amazon Root CA 1.cer" >> "$CONJUR_SSL_CERTIFICATE"

ansible-playbook -i inventory playbook.yml
