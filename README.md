## Linux Server Hardening & Security Assessment Lab ##

## Summary

A hands-on cybersecurity lab that uses Ubuntu Server as the target system and Kali Linux as the security testing machine. The project focuses on Linux server hardening, security verification, and repeatable security assessments.

## Goals

* Configure an isolated lab network.
* Secure SSH administrative access.
* Apply firewall rules using UFW.
* Configure Fail2ban and automatic security updates.
* Automate security checks using Bash scripts.
* Compare security assessment results before and after hardening.
* Document the configuration, tests, findings, and limitations.

## Lab Architecture

| Component     | Role                     | Planned Lab IP   |
| ------------- | ------------------------ | ---------------- |
| Ubuntu Server | Server being hardened    | `10.10.10.20/24` |
| Kali Linux    | Security testing machine | `10.10.10.10/24` |

The lab uses VirtualBox. The two VMs are intended to communicate over an isolated internal network named `SecurityLab`. Internet connectivity may use a separate NAT adapter.

## Planned Security Controls

* SSH configuration and key-based authentication
* Restricted administrative access
* UFW firewall configuration
* Fail2ban
* Automatic security updates
* Bash-based verification
* Nmap-based network assessment

These controls will be marked as implemented only after configuration and testing.

## Repository Structure

* `docs/` — architecture, installation instructions, and security report
* `configs/` — example configuration files and configuration notes
* `scripts/` — hardening and verification automation
* `tests/` — connectivity tests and verification checklist
* `evidence/before/` — baseline evidence
* `evidence/after/` — post-hardening evidence
* `evidence/scan-results/` — authorized lab scan results

## Project Status

**In progress.** The initial repository and folder structure are being prepared. Security controls and assessment results will be documented after they are implemented and verified.

## Safety and Scope

All security assessments are intended for the owner's isolated VirtualBox lab or other systems for which explicit authorization has been granted. Do not scan systems without permission.

## Limitations

The project is a learning lab, not a guarantee that a system is secure or suitable for production deployment.

## Author

Md. Nahid Al Mamun

