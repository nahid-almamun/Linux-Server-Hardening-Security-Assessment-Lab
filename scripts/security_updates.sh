#!/usr/bin/env bash
set -euo pipefail

AUTO_UPGRADES="/etc/apt/apt.conf.d/20auto-upgrades"

if [[ $EUID -ne 0 ]]; then
 echo "Run this script with sudo"
 exit 1
fi

apt-get update
apt-get install -y unattended-upgrades

cat > "$AUTO_UPGRADES" <<'EOF'
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF

systemctl enable --now unattended-upgrades
unattended-upgrade --dry-run --debug

echo
echo "Automatic Security Updates enabled"
