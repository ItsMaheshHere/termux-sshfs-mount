#!/bin/bash

# 1.Ask username
echo "Enter your Termux username(type 'whoami' in termux to see):"
read -p "Username:" username

# 2.Get IP
IP=$(ip route show default | awk '{print $3}')
if[-z "$IP"]; then
	echo "ERROR: Could Not get IP"
	exit 1
fi

echo "Target: $username@$IP"

# 3.Mount Storage
mkdir -p ~/AndroidMount
sshfs -p 8022 $username@$IP:storage/emulated/0 ~/AndroidMount

if[$? -eq 0];then
	echo "Success! Storage mounted."
else
	echo "check Termux 'sshd' is running ?"
fi