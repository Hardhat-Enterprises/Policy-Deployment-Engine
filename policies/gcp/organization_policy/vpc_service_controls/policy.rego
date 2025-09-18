package terraform.gcp.security.organization_policy.vpc_service_controls

default details = []
default message = []

# Violation when boolean_policy exists but not enforced
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.name != null
  regex.match("vpcServiceControls", after.name)
  after.boolean_policy.enforced == false

  d := {
    "resource_address": rc.address,
    "attribute": "boolean_policy.enforced",
    "why": "Org policy must enforce VPC Service Controls"
  }
}

# Violation when spec.rules exist but do not include 'inVpcServiceControls'
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.name != null
  regex.match("vpcServiceControls", after.name)
  some i
  rule := after.spec.rules[i]
  not rule_has_required_value(rule)

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.values.allowed_values",
    "why": "Org policy must restrict allowed values to 'inVpcServiceControls'"
  }
}

# Helper: rule must have the required value
rule_has_required_value(rule) if {
  some j
  rule.values.allowed_values[j] == "inVpcServiceControls"
}

details = [d | d := violation[_]]

message = ["Org policy must enforce VPC Service Controls"] if {
  count(details) > 0
}
