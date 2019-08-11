#!/bin/bash
#

set -e

DOMAIN=$(hostname -f)
CMAIL=$1

if [ -z "$CMAIL" ]; then
	read -p "Certbot mail: " CMAIL
fi

mkdir -p /opt/proxmox-certbot

cp certbot-proxmox-deploy.sh /opt/proxmox-certbot

certbot certonly \
  --non-interactive --agree-tos -m $CMAIL \
  --dns-cloudflare \
  --dns-cloudflare-credentials /opt/proxmox-certbot/cloudflare.ini \
  --deploy-hook /opt/proxmox-certbot/certbot-proxmox-deploy.sh \
  --force-renewal \
  -d ${DOMAIN}

