# ==========================
# create_pde_files.ps1
# ==========================

# --- POLICY DEFINITIONS ---

# SSH
$sshPolicy = @'
package terraform.gcp.security.compute.ssh.open_to_world

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.ssh.vars

__metadata__ := {
  "title": "SSH open to the world",
  "description": "SSH (port 22) must not be exposed to 0.0.0.0/0 in GCP firewall rules.",
  "severity": "high",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  some i
  rc := input.resource_changes[i]
  rc.type == vars.variables.resource_type
  ingress := rc.change.after.allow[_]
  ingress.protocol == "tcp"
  ingress.ports[_] == "22"
  rc.change.after.source_ranges[_] == "0.0.0.0/0"
  msg := sprintf("Resource '%v' exposes SSH (port 22) to the world (0.0.0.0/0). Restrict access to authorized IP ranges.", [rc.address])
}
'@

$sshInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_firewall.allow-ssh",
      "type": "google_compute_firewall",
      "change": {
        "after": {
          "name": "allow-ssh",
          "allow": [
            { "protocol": "tcp", "ports": ["22"] }
          ],
          "source_ranges": ["0.0.0.0/0"]
        }
      }
    }
  ]
}
'@

# RDP
$rdpPolicy = @'
package terraform.gcp.security.compute.rdp.open_to_world

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.rdp.vars

__metadata__ := {
  "title": "RDP open to the world",
  "description": "RDP (port 3389) must not be exposed to 0.0.0.0/0 in GCP firewall rules.",
  "severity": "high",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  ingress := rc.change.after.allow[_]
  ingress.protocol == "tcp"
  ingress.ports[_] == "3389"
  rc.change.after.source_ranges[_] == "0.0.0.0/0"
  msg := sprintf("Resource '%v' exposes RDP (port 3389) to the world.", [rc.address])
}
'@

$rdpInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_firewall.allow-rdp",
      "type": "google_compute_firewall",
      "change": {
        "after": {
          "name": "allow-rdp",
          "allow": [
            { "protocol": "tcp", "ports": ["3389"] }
          ],
          "source_ranges": ["0.0.0.0/0"]
        }
      }
    }
  ]
}
'@

# TELNET
$telnetPolicy = @'
package terraform.gcp.security.compute.telnet.enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.telnet.vars

__metadata__ := {
  "title": "Telnet must be disabled",
  "description": "Telnet (port 23) should not be enabled in firewall rules.",
  "severity": "medium",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  ingress := rc.change.after.allow[_]
  ingress.protocol == "tcp"
  ingress.ports[_] == "23"
  msg := sprintf("Resource '%v' allows insecure Telnet (port 23).", [rc.address])
}
'@

$telnetInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_firewall.allow-telnet",
      "type": "google_compute_firewall",
      "change": {
        "after": {
          "name": "allow-telnet",
          "allow": [
            { "protocol": "tcp", "ports": ["23"] }
          ]
        }
      }
    }
  ]
}
'@

# FTP
$ftpPolicy = @'
package terraform.gcp.security.compute.ftp.anonymous_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.ftp.vars

__metadata__ := {
  "title": "Anonymous FTP access",
  "description": "FTP must not allow anonymous access.",
  "severity": "medium",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_compute_instance"
  rc.change.after.metadata["ftp_anonymous"] == "enabled"
  msg := sprintf("Resource '%v' allows anonymous FTP access.", [rc.address])
}
'@

$ftpInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_instance.ftp-server",
      "type": "google_compute_instance",
      "change": {
        "after": {
          "name": "ftp-server",
          "metadata": { "ftp_anonymous": "enabled" }
        }
      }
    }
  ]
}
'@

# SMTP
$smtpPolicy = @'
package terraform.gcp.security.compute.smtp.open_relay

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.smtp.vars

__metadata__ := {
  "title": "SMTP open relay",
  "description": "SMTP must not be configured as an open relay.",
  "severity": "high",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_compute_instance"
  rc.change.after.metadata["smtp_relay"] == "open"
  msg := sprintf("Resource '%v' is configured as an open SMTP relay.", [rc.address])
}
'@

$smtpInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_instance.mail-server",
      "type": "google_compute_instance",
      "change": {
        "after": {
          "name": "mail-server",
          "metadata": { "smtp_relay": "open" }
        }
      }
    }
  ]
}
'@

# SQL
$sqlPolicy = @'
package terraform.gcp.security.sql.db.public_exposure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.sql.db.vars

__metadata__ := {
  "title": "SQL DB public exposure",
  "description": "Cloud SQL instances must not be publicly accessible.",
  "severity": "high",
  "category": "database",
  "service": "sql"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_sql_database_instance"
  rc.change.after.settings.ip_configuration.ipv4_enabled
  msg := sprintf("SQL instance '%v' is publicly accessible.", [rc.address])
}
'@

$sqlInput = @'
{
  "resource_changes": [
    {
      "address": "google_sql_database_instance.mydb",
      "type": "google_sql_database_instance",
      "change": {
        "after": {
          "name": "mydb",
          "settings": {
            "ip_configuration": { "ipv4_enabled": true }
          }
        }
      }
    }
  ]
}
'@

# DNS
$dnsPolicy = @'
package terraform.gcp.security.dns.managed_zone.recursion_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dns.managed_zone.vars

__metadata__ := {
  "title": "DNS recursion must be disabled",
  "description": "Managed DNS zones must not allow recursion.",
  "severity": "medium",
  "category": "dns",
  "service": "dns"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_dns_managed_zone"
  rc.change.after.recursion_available
  msg := sprintf("DNS zone '%v' has recursion enabled.", [rc.address])
}
'@

$dnsInput = @'
{
  "resource_changes": [
    {
      "address": "google_dns_managed_zone.example-zone",
      "type": "google_dns_managed_zone",
      "change": {
        "after": {
          "name": "example-zone",
          "recursion_available": true
        }
      }
    }
  ]
}
'@

# BACKEND SERVICE
$backendPolicy = @'
package terraform.gcp.security.compute.backend_service.redirect_disabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.backend_service.vars

__metadata__ := {
  "title": "Backend service redirect must be enabled",
  "description": "GCP backend services should enforce HTTPS redirect.",
  "severity": "medium",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_compute_backend_service"
  not rc.change.after.enable_redirect
  msg := sprintf("Backend service '%v' does not enforce HTTPS redirect.", [rc.address])
}
'@

$backendInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_backend_service.default",
      "type": "google_compute_backend_service",
      "change": {
        "after": { "name": "default", "enable_redirect": false }
      }
    }
  ]
}
'@

# FIREWALL EGRESS
$fwEgressPolicy = @'
package terraform.gcp.security.compute.firewall.egress_allowlist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.firewall.vars

__metadata__ := {
  "title": "Egress traffic allowlist",
  "description": "Firewall egress rules must restrict destinations.",
  "severity": "high",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_compute_firewall"
  rc.change.after.direction == "EGRESS"
  rc.change.after.destination_ranges[_] == "0.0.0.0/0"
  msg := sprintf("Firewall '%v' allows unrestricted egress traffic.", [rc.address])
}
'@

$fwEgressInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_firewall.egress-rule",
      "type": "google_compute_firewall",
      "change": {
        "after": {
          "name": "egress-rule",
          "direction": "EGRESS",
          "destination_ranges": ["0.0.0.0/0"]
        }
      }
    }
  ]
}
'@

# FIREWALL DEFAULT
$fwDefaultPolicy = @'
package terraform.gcp.security.compute.firewall.default_deny

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.firewall.vars

__metadata__ := {
  "title": "Default firewall deny",
  "description": "Default firewall rules must deny all unless explicitly allowed.",
  "severity": "critical",
  "category": "networking",
  "service": "compute"
}

deny[msg] {
  rc := input.resource_changes[_]
  rc.type == "google_compute_firewall"
  rc.change.after.name == "default-allow-all"
  msg := sprintf("Default firewall rule '%v' allows all traffic. It must be removed or restricted.", [rc.address])
}
'@

$fwDefaultInput = @'
{
  "resource_changes": [
    {
      "address": "google_compute_firewall.default-allow-all",
      "type": "google_compute_firewall",
      "change": {
        "after": { "name": "default-allow-all" }
      }
    }
  ]
}
'@

# --- ENTRY DEFINITIONS ---
$entries = @(
  @{ service="compute"; resource="ssh"; attribute="open_to_world"; vars=@{friendly="SSH Firewall Rule"; resource_type="google_compute_firewall"; resource_value_name="name"}; policy=$sshPolicy; input=$sshInput },
  @{ service="compute"; resource="rdp"; attribute="open_to_world"; vars=@{friendly="RDP Firewall Rule"; resource_type="google_compute_firewall"; resource_value_name="name"}; policy=$rdpPolicy; input=$rdpInput },
  @{ service="compute"; resource="telnet"; attribute="enabled"; vars=@{friendly="Telnet Rule"; resource_type="google_compute_firewall"; resource_value_name="name"}; policy=$telnetPolicy; input=$telnetInput },
  @{ service="compute"; resource="ftp"; attribute="anonymous_access"; vars=@{friendly="FTP Rule"; resource_type="google_compute_instance"; resource_value_name="name"}; policy=$ftpPolicy; input=$ftpInput },
  @{ service="compute"; resource="smtp"; attribute="open_relay"; vars=@{friendly="SMTP Rule"; resource_type="google_compute_instance"; resource_value_name="name"}; policy=$smtpPolicy; input=$smtpInput },
  @{ service="sql"; resource="db"; attribute="public_exposure"; vars=@{friendly="SQL Database"; resource_type="google_sql_database_instance"; resource_value_name="name"}; policy=$sqlPolicy; input=$sqlInput },
  @{ service="dns"; resource="managed_zone"; attribute="recursion_enabled"; vars=@{friendly="DNS Zone"; resource_type="google_dns_managed_zone"; resource_value_name="name"}; policy=$dnsPolicy; input=$dnsInput },
  @{ service="compute"; resource="backend_service"; attribute="redirect_disabled"; vars=@{friendly="Backend Service"; resource_type="google_compute_backend_service"; resource_value_name="name"}; policy=$backendPolicy; input=$backendInput },
  @{ service="compute"; resource="firewall"; attribute="egress_allowlist"; vars=@{friendly="Firewall Egress Rule"; resource_type="google_compute_firewall"; resource_value_name="name"}; policy=$fwEgressPolicy; input=$fwEgressInput },
  @{ service="compute"; resource="firewall"; attribute="default_deny"; vars=@{friendly="Default Firewall"; resource_type="google_compute_firewall"; resource_value_name="name"}; policy=$fwDefaultPolicy; input=$fwDefaultInput }
)

# --- FILE CREATION ---
foreach ($entry in $entries) {
  $service = $entry.service
  $resource = $entry.resource
  $attribute = $entry.attribute

  $basePath = "inputs/gcp/$service/$resource/$attribute"
  $policyPath = "policies/gcp/$service/$resource/$attribute"

  New-Item -ItemType Directory -Force -Path $basePath | Out-Null
  New-Item -ItemType Directory -Force -Path $policyPath | Out-Null

  $entry.policy | Set-Content -Path "$policyPath/policy.rego"

  @"
package terraform.gcp.security.$service.$resource.vars

variables := {
  "friendly": "$($entry.vars.friendly)",
  "resource_type": "$($entry.vars.resource_type)",
  "resource_value_name": "$($entry.vars.resource_value_name)"
}
"@ | Set-Content -Path "$policyPath/vars.rego"

  $entry.input | Set-Content -Path "$basePath/plan.json"

  Write-Output "Created policy and input for $service/$resource/$attribute"
}
