#!/bin/bash
#

cp -f certbot.service /lib/systemd/system/certbot.service
cp -f certbot.timer /lib/systemd/system/certbot.timer

systemctl start certbot.timer
systemctl enable certbot.timer
