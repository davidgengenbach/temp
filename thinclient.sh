#!/usr/bin/env bash

echo "Enter hostname (without .patagona.office), followed by [ENTER]:"

read new_hostname

echo "Are you sure you want to use hostname: $new_hostname? Press [ENTER] to continue."

read xxx

hostnamectl set-hostname $new_hostname

echo "${new_hostname}.patagona.office" > /etc/salt/minion_id

echo "Adding 'thinclient' role"
salt-call --local grains.append roles thinclient

for action in start enable restart status; do
  systemctl $action salt-minion
done

read -p "Restart? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  reboot
fi