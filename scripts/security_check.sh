#!/usr/bin/env bash
set -uo pipefail

REPORT="security-check-report.txt"

{
 echo "Linux Server Security Check"
 echo "Date: $(date)"
 echo

 echo "=== SSH effective settings ==="
 sudo sshd -T | grep -E 'permitrootlogin|passwordauthentication|pubkeyauthentication|maxauthtries|allowusers'
 echo

 echo "=== UFW firewall status ==="
 sudo ufw status verbose
 echo

 echo "=== Fail2ban SSH jail ==="
 sudo fail2ban-client status sshd
 echo

 echo "=== Automatic Security Updates ==="
 cat /etc/apt/apt.conf.d/20auto-upgrades
 systemctl is-active unattended-upgrades.service
 systemctl is-enabled unattended-upgrades.service
 echo

 echo "=== Listening TCP Ports ==="
 sudo ss -tlnp
} | tee "$REPORT"

 echo
 echo "Security check complete. Report saved to $REPORT"

