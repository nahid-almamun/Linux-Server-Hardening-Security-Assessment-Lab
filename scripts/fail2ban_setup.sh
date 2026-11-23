#!/usr/bin/env bash
set -euo pipefail

FAIL2BAN_DIR="/etc/fail2ban/jail.d"
SSHD_JAIL= "$FAIL2BAN_DIR/sshd.local"

if [[ $EUID -ne 0 ]]; then
 echo "Run this script with sudo"
 exit 1
fi

apt-get update
apt-get install -y fail2ban

mkdir -p "$FAIL2BAN_DIR"

cat > "$SSHD_JAIL" <<'EOF'
[sshd]
enabled = true
port = ssh
backend = systemd
maxretry = 3
findtime = 10m
bantime = 1h
banaction = ufw
EOF

systemctl enable --now fail2ban
systemctl restart fail2ban

fail2ban-client status
fail2ban-client status sshd
