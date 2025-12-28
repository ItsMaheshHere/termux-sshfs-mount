#!/bin/bash

cnfg="$HOME/.termux_mount-config"
# 1.Ask username
if [ ! -f "$cnfg" ]; then
	echo "this is your first setup!"
	echo "Enter your Termux username(type 'whoami' in termux to see):"
	read -p "Username:" username
	echo "username=$username" > "$cnfg"
else
	source "$cnfg"
fi

# 2.Get IP
IP=$(ip route | grep "default via" | awk '{print $3}' | head -n 1)
if [ -z "$IP" ]; then
	echo "ERROR: Could Not get IP"
	exit 1
fi

echo "Target: $username@$IP"

# 3.Mount Storage
mkdir -p ~/AndroidMount
sshfs -p 8022 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $username@$IP:/storage/emulated/0 ~/AndroidMount

if [ $? -eq 0 ]; then
	echo "Success! Storage mounted."
else
	echo "check Termux 'sshd' is running ?"
fi
