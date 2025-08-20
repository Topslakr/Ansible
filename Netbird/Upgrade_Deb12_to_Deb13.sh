#!/bin/bash
set -euo pipefail

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

echo "Starting Debian 12 -> Debian 13 upgrade and Ansible tooling setup"

# 1. Update current system
echo "Updating current packages..."
apt update
apt -y full-upgrade
apt -y autoremove

# 2. Update sources.list to point to Debian 13 (Trixie)
echo "Backing up sources.list..."
cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo "Updating sources.list to Debian 13..."
sed -i 's/bookworm/trixie/g' /etc/apt/sources.list

# Optional: update any third-party sources as needed

# 3. Update package lists for Debian 13
echo "Updating package lists..."
apt update

# 4. Minimal system upgrade
echo "Performing minimal upgrade..."
apt -y upgrade

# 5. Full system upgrade
echo "Performing full system upgrade..."
apt -y full-upgrade

# 6. Clean up
echo "Cleaning up..."
apt -y autoremove
apt -y autoclean

# 7. Install Ansible tooling
echo "Installing Ansible and dependencies..."
apt -y install python3 python3-pip ansible

echo "Upgrade complete. Rebooting!"
reboot
