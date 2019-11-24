#!/bin/bash
#

set -e

ipa-cacert-manage install "${RENEWED_LINEAGE}/chain.pem"

ipa-certupdate

# Install the new Key/Cert, root does not need passwords like mere mortals
echo '' | ipa-server-certinstall -w -d "${RENEWED_LINEAGE}/fullchain.pem" "${RENEWED_LINEAGE}/privkey.pem" --dirman-password='' --pin=''

# Certificates updated; restarting services
ipactl restart
