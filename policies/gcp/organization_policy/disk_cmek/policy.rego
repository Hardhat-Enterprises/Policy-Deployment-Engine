package terraform.gcp.security.organization_policy.disk_cmek

default details = []
default message = []

# Violation when boolean_policy exists but is not enforced
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.name != null
  regex.match("requireCmekForDiskCreation", after.name)
  after.boolean_policy.enforced == false

  d := {
    "resource_address": rc.address,
    "attribute": "boolean_policy.enforced",
    "why": "Org policy must enforce CMEK for disk creation"
  }
}

# Violation when spec.rules exists but does not enforce
violation[d] if {
  rc := input.resource_changes[_]
  after := rc.change.after
  regex.match("requireCmekForDiskCreation", after.name)
  some i
  rule := after.spec.rules[i]
  not rule.enforce

  d := {
    "resource_address": rc.address,
    "attribute": "spec.rules.enforce",
    "why": "Org policy must enforce CMEK for disk creation"
  }
}

details = [d | d := violation[_]]

message = ["Org policy must enforce CMEK for disk creation"] if {
  count(details) > 0
}
