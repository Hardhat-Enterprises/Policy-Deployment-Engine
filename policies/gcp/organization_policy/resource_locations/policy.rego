package terraform.gcp.security.organization_policy.resource_locations

import data.terraform.gcp.security.organization_policy.vars

default details := []
default message := []

invalid_location[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  endswith(rc.change.after.name, "gcp.resourceLocations")

  some i
  rule := rc.change.after.spec.rules[i]

  some j
  val := rule.values.allowed_values[j]
  not startswith(val, "in:us-")

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.values.allowed_values",
    "why": sprintf("Resource location '%s' is outside approved US regions", [val])
  }
}

details := [d | d := invalid_location[_]]

message := ["Org policy must restrict resources to US regions only"] if { count(details) > 0 }
