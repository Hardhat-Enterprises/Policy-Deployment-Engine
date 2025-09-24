# Policy-Deployment-Engine

pip requirements pending

if errors, just do pip install for those libraries

Assumed there are similar templates in aws and azure folder

This repository contains OPA (Open Policy Agent) policies for validating **network service configurations**.  
Additional cloud-specific policies (AWS, Azure, GCP) are expected to follow a **similar template structure**.

> Python dependencies (for reporting/automation) are pending.  
> If errors occur, simply `pip install <missing-library>` as needed.

## Repository Layout

policies/network_services/ # 10 rules + _helpers.rego
inputs/ # pass/fail input JSONs
tests/network_services/ # unit tests per rule

---

## Prerequisites

- [OPA CLI](https://www.openpolicyagent.org/docs/latest/#running-opa) installed and in PATH  
- Git + VS Code  
- (Optional) Python 3.x with pip  

Check installation:

```powershell
opa version
git --version

## Setup

Clone this repo:

git clone https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine.git
cd Policy-Deployment-Engine

Sample inputs are already included in /inputs:
inputs/network_services_fail.json
inputs/network_services_pass.json

# Input JSON Structure
inputs/network_services_pass.json:
{
  "services": [
    {"name": "ssh", "port": 22, "protocol": "tcp", "allow": ["10.0.0.0/24"]},
    {"name": "rdp", "port": 3389, "protocol": "tcp", "allow": ["192.168.1.0/24"]},
    {"name": "ftp-anon", "port": 21, "protocol": "tcp", "anonymous": false},
    {"name": "http", "port": 80, "protocol": "tcp", "redirect_https": true},
    {"name": "db", "port": 3306, "protocol": "tcp", "allow": ["172.16.0.0/16"]},
    {"name": "dns", "port": 53, "protocol": "udp", "resolvers": ["1.1.1.1", "8.8.8.8"]},
    {"name": "smtp", "port": 25, "protocol": "tcp", "relay": "198.51.100.20"},
    {"name": "egress", "cidrs": ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16", "1.1.1.1/32"]}
  ]
}

# Policy Deployment Engine – Network Services Policies

This module provides **10 OPA Rego policies** for common network service security checks:
- SSH
- RDP
- Telnet
- FTP anonymous login
- HTTP → HTTPS redirection
- Database ports
- Default deny
- Egress allowlist
- DNS resolvers
- SMTP relays
## Auto-create All Rego Policies
Run this PowerShell script from repo root to generate all 10 policies + helpers:
# Go to repo root
Set-Location D:\Repo\Policy-Deployment-Engine

# Define policy folder
$policyDir = ".\policies\network_services"

# Ensure directory exists
New-Item -Path $policyDir -ItemType Directory -Force | Out-Null
PowerShell Script: setup-policies.ps1
# Define base dir
$policyDir = "policies\network_services"
New-Item -ItemType Directory -Force -Path $policyDir | Out-Null

# --- _helpers.rego ---
package network_services.helpers

# DNS resolvers (Cloudflare + Google)
dns_allowlist := {
  "1.1.1.1",
  "1.0.0.1",
  "8.8.8.8",
  "8.8.4.4"
}

# Egress allowlist (private nets + DNS)
egress_allowlist := {
  "10.0.0.0/8",
  "172.16.0.0/12",
  "192.168.0.0/16",
  "1.1.1.1/32",
  "1.0.0.1/32",
  "8.8.8.8/32",
  "8.8.4.4/32"
}

# SMTP relay allowlist (test IPs, replace later)
smtp_allowlist := {
  "198.51.100.20",
  "203.0.113.25"
}

# ---------------------------------------------------
# Helper function to format range validation messages
# ---------------------------------------------------
format_range_validation_message(field, value, min, max) := msg if {
  msg := sprintf("Field '%v' with value '%v' is out of range. Allowed range is [%v - %v].", [field, value, min, max])
}

# --- db.rego ---
package network_services.db

__metadata__ := {
  "title": "DB open to the world",
  "description": "Databases should not be exposed to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "db"
  svc.port == 3306
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("Database '%v' is open to the world on port %v", [svc.name, svc.port])
}

# --- default_deny.rego ---
package network_services.default_deny

__metadata__ := {
  "title": "Default deny all",
  "description": "Traffic should be denied unless explicitly allowed",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  not svc.allow
  msg := sprintf("Service '%v' on port %v has no allow rules (denied by default)", [svc.name, svc.port])
}


# --- dns.rego ---
package network_services.dns

__metadata__ := {
  "title": "DNS open to the world",
  "description": "DNS should not be exposed to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "dns"
  svc.port == 53
  svc.protocol == "udp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("DNS '%v' is open to the world on port %v", [svc.name, svc.port])
}

# --- egress_allowlist.rego ---
package network_services.egress_allowlist

__metadata__ := {
  "title": "Egress allowlist enforcement",
  "description": "Egress traffic should only be allowed to explicitly allowed networks",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  not svc.destination_allow
  msg := sprintf("Service '%v' has no destination allowlist", [svc.name])
}

# --- ftp_anon.rego ---
package network_services.ftp_anon

__metadata__ := {
  "title": "FTP anonymous access",
  "description": "Anonymous FTP access should be disabled",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "ftp"
  svc.anon_access == true
  msg := sprintf("FTP '%v' allows anonymous access", [svc.name])
}

# --- http_to_https.rego ---
package network_services.http_to_https

__metadata__ := {
  "title": "HTTP to HTTPS redirect",
  "description": "Services should enforce HTTPS instead of plain HTTP",
  "severity": "medium"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "http"
  not svc.redirect_https
  msg := sprintf("HTTP service '%v' does not enforce HTTPS redirection", [svc.name])
}

# --- rdp.rego ---
package network_services.rdp

__metadata__ := {
  "title": "RDP open to the world",
  "description": "RDP should not be open to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "rdp"
  svc.port == 3389
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("RDP '%v' is open to the world on port %v", [svc.name, svc.port])
}

# --- smtp.rego ---
package network_services.smtp

__metadata__ := {
  "title": "SMTP open relay",
  "description": "SMTP should not be an open relay",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "smtp"
  svc.open_relay == true
  msg := sprintf("SMTP '%v' is configured as an open relay", [svc.name])
}

# --- ssh.rego ---
package network_services.ssh

__metadata__ := {
  "title": "SSH open to the world",
  "description": "SSH service should not be open to 0.0.0.0/0",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "ssh"
  svc.port == 22
  svc.protocol == "tcp"
  svc.allow[_] == "0.0.0.0/0"
  msg := sprintf("SSH '%v' is open to the world on port %v", [svc.name, svc.port])
}
# --- telnet.rego ---
package network_services.telnet

__metadata__ := {
  "title": "Telnet usage",
  "description": "Telnet should not be enabled (use SSH instead)",
  "severity": "high"
}

deny[msg] if {
  svc := input.services[_]
  svc.name == "telnet"
  svc.port == 23
  svc.protocol == "tcp"
  svc.enabled == true
  msg := sprintf("Telnet '%v' is enabled on port %v", [svc.name, svc.port])
}

Write-Host "All network service policies created under $policyDir"

## Check files created:
Get-ChildItem policies\network_services
Directory: D:\Repo\Policy-Deployment-Engine\policies\network_services


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         9/20/2025   8:58 AM            335 db.rego
-a----         9/20/2025   8:58 AM            406 default_deny.rego
-a----         9/20/2025   8:58 AM            416 dns.rego
-a----         9/20/2025   8:58 AM            400 egress_allowlist.rego
-a----         9/20/2025   8:58 AM            356 ftp_anon.rego
-a----         9/20/2025   8:58 AM            350 http_to_https.rego
-a----         9/20/2025   8:58 AM            343 rdp.rego
-a----         9/20/2025   8:58 AM            408 smtp.rego
-a----         9/20/2025   8:58 AM            334 ssh.rego
-a----         9/20/2025   8:58 AM            321 telnet.rego
-a----         9/20/2025   8:58 AM            464 _helpers.rego
---
## Running Policies
Evaluate policies against inputs:
opa eval -i inputs/network_services_fail.json -d policies "data.network_services"

## Run unit tests:
opa test policies tests -v
opa test policies/
PASS: 20/20