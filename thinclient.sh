#!/usr/bin/env bash

echo "Enter hostname (without .patagona.office), followed by [ENTER]:"

read new_hostname

echo "Are you sure you want to use hostname: $new_hostname?"

read xxx

hostnamectl set-hostname $new_hostname

echo "${new_hostname}.patagona.office" > /etc/salt/minion_id


for action in start enable status; do
  systemctl $action salt-minion
done

echo "Restart?"

read -p "Are you alright? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  reboot
fi