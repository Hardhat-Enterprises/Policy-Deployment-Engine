package terraform.gcp.security.organization_policy.require_os_login

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

oslogin_disabled[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "compute.requireOsLogin")

  some i
  rule := rc.change.after.spec.rules[i]
  not rule.enforce

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.enforce",
    "why": "OS Login must be enforced for secure IAM-based SSH"
  }
}

details := [d | d := oslogin_disabled[_]]

message := ["OS Login org policy must enforce true"] if { count(details) > 0 }
