package terraform.gcp.security.organization_policy.vm_no_external_ip

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

external_ip_allowed[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "compute.vmExternalIpAccess")

  some i
  rule := rc.change.after.spec.rules[i]
  not rule.deny_all

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.deny_all",
    "why": "VMs must not have external IPs"
  }
}

details := [d | d := external_ip_allowed[_]]

message := ["Org policy must deny external IP access for VMs"] if { count(details) > 0 }
