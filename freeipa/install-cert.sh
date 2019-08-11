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

certbot certonly \
  --non-interactive --agree-tos -m $CMAIL \
  --dns-cloudflare \
  --dns-cloudflare-credentials /opt/freeipa-certbot/cloudflare.ini \
  --deploy-hook /opt/freeipa-certbot/certbot-freeipa-deploy.sh \
  --force-renewal \
  -d ${DOMAIN}

