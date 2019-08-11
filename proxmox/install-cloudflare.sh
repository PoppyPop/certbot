#!/bin/bash
#

set -e

mkdir -p /opt/proxmox-certbot

read -p "Cloudflare user: " CFUSER
read -p "Cloudflare password: " CFPASSWORD

printf "dns_cloudflare_email=${CFUSER}\ndns_cloudflare_api_key=${CFPASSWORD}\n" > /opt/proxmox-certbot/cloudflare.ini
chmod a-x,go-rw /opt/proxmox-certbot/cloudflare.ini