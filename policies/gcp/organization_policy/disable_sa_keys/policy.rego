package terraform.gcp.security.organization_policy.disable_sa_keys

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

sa_keys_enabled[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "iam.disableServiceAccountKeyCreation")

  some i
  rule := rc.change.after.spec.rules[i]
  not rule.enforce

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.enforce",
    "why": "Service account key creation must be disabled to prevent unmanaged keys"
  }
}

details := [d | d := sa_keys_enabled[_]]

message := ["Org policy must disable service account key creation"] if { count(details) > 0 }

