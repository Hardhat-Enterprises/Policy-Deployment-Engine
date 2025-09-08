package terraform.gcp.security.organization_policy.allowed_machine_types

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

too_large_instance[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "compute.allowedMachineTypes")

  some i
  rule := rc.change.after.spec.rules[i]

  some j
  val := rule.values.allowed_values[j]
  startswith(val, "n1-ultramem")

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.values.allowed_values",
    "why": sprintf("Machine type '%s' is not allowed (too large/expensive)", [val])
  }
}

details := [d | d := too_large_instance[_]]

message := ["Org policy must restrict large machine types"] if { count(details) > 0 }
