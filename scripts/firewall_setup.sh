#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
 echo "Run this script with sudo"
 exit 1
fi

apt-get update
apt-get install -y ufw

ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw --force enable

ufw status verbose


