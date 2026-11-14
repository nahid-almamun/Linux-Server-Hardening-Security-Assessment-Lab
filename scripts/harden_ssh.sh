#!/usr/bin/env bash
set -euo pipefail

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.backup.$(date +%F-%H%M%S)"

if [[ $EUID -ne 0 ]]; then
 echo "Run this script with sudo"
 exit 1
fi

cp "$SSHD_CONFIG" "$BACKUP"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSHD_CONFIG"
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' "$SSHD_CONFIG"
sed -i 's/^#\?MaxAuthTries.*/MaxAuthTries 3/' "$SSHD_CONFIG"
sed -i 's/^#\?LoginGraceTime.*/LoginGraceTime 30/' "$SSHD_CONFIG"

if ! grep -q '^AllowUsers ubuntu' "$SSHD_CONFIG"; then
 echo 'AllowUsers ubuntu' >> "$SSHD_CONFIG"
fi

sshd -t

echo "SSH configuration validated"
echo "Backup saved to: $BACKUP"
echo "Restart SSH only after confirming you have another active session."
