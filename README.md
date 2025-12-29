# 📱 Termux SSHFS Mount

A **lightweight Bash script** to wirelessly mount your Android phone's storage to Linux (Kali, Ubuntu, Arch, etc.) using **Termux** and **SSHFS**.  

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE) [![Linux](https://img.shields.io/badge/Linux-Compatible-blue.svg)]()

✨ **Features**
- Mount your phone without USB cables
- Remembers your Termux username after first run
- Works on Kali, Ubuntu, Arch, and other Linux distributions

📱 **Android Setup**
```bash
# Install OpenSSH in Termux
pkg install openssh

# Setup storage access
termux-setup-storage
# Allow storage permission when prompted

# Set a Termux password
passwd

# Check Termux username (needed for the script)
whoami
```

## 💻 Linux/Kali Setup
```bash
# Install sshfs
sudo apt install sshfs

# Clone the repository
git clone https://github.com/ItsMaheshHere/termux-sshfs-mount.git
cd termux-sshfs-mount

# Make the script executable
chmod +x connect_phone.sh
```
## 🚀 Usage
```bash
# Turn on Mobile Hotspot and connect your Linux laptop to it

# Start SSH server in Termux
sshd

# Run the script on Linux
./connect_phone.sh

# - First run: enter your Termux username (e.g., u0_a123)
# - Script detects phone IP and prompts for Termux password
# - Success: files appear in ~/AndroidMount

# To disconnect
fusermount -u ~/AndroidMount
```

## 🔧 Troubleshooting
```bash
# Error: Connection reset by peer
pkill sshd
sshd
# Ensure the script uses -o StrictHostKeyChecking=no (included)

# Error: Connection refused
# Make sure you are connected to the Mobile Hotspot
# Ensure the script detects the correct Gateway IP

# Error: Permission denied
# Did you run termux-setup-storage on the phone?
# Are you using the correct password set via passwd?
```
