package terraform.gcp.security.orgpolicy.shielded_vm

import data.terraform.gcp.security.orgpolicy.vars

default details := []
default message := []

not_enforced[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "compute.requireShieldedVm")

  some i
  rule := rc.change.after.spec.rules[i]
  not rule.enforce

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.enforce",
    "why": "Shielded VM must be enforced"
  }
}

details := [d | d := not_enforced[_]]

message := ["Shielded VM org policy must enforce true"] if { count(details) > 0 }
