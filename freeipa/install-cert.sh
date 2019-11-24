#!/bin/bash
#

set -e

DOMAIN=$(hostname -f)
CMAIL=$1

if [ -z "$CMAIL" ]; then
	read -p "Certbot mail: " CMAIL
fi

mkdir -p /opt/freeipa-certbot

cp certbot-freeipa-deploy.sh /opt/freeipa-certbot

curl https://letsencrypt.org/certs/trustid-x3-root.pem.txt -o trustid-x3-root.pem

ipa-cacert-manage install trustid-x3-root.pem

rm trustid-x3-root.pem

ipa-certupdate

certbot certonly \
  --non-interactive --agree-tos -m $CMAIL \
  --dns-cloudflare \
  --dns-cloudflare-credentials /opt/freeipa-certbot/cloudflare.ini \
  --deploy-hook /opt/freeipa-certbot/certbot-freeipa-deploy.sh \
  --force-renewal \
  -d ${DOMAIN}

