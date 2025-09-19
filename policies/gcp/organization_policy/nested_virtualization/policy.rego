package terraform.gcp.security.organization_policy.nested_virtualization

default details = []
default message = []

# Violation when boolean_policy exists but not enforced
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.name != null
  regex.match("disableNestedVirtualization", after.name)
  after.boolean_policy.enforced == false

  d := {
    "resource_address": rc.address,
    "attribute": "boolean_policy.enforced",
    "why": "Nested virtualization must be disabled at org level"
  }
}

# Violation when spec.rules exist but not enforced
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  regex.match("disableNestedVirtualization", after.name)
  some i
  rule := after.spec.rules[i]
  not rule.enforce

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.enforce",
    "why": "Nested virtualization must be disabled at org level"
  }
}

details = [d | d := violation[_]]

message = ["Org policy must disable nested virtualization"] if {
  count(details) > 0
}
