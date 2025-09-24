package terraform.gcp.security.organization_policy.nested_virtualization

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

# Conditions: Enforce nested virtualization must be disabled
conditions := [
  [
    {
      "situation_description": "Nested virtualization must be disabled in organization policy",
      "remedies": ["Set enforce = true in disableNestedVirtualization policy"]
    },
    {
      "condition": "Check if enforce is true",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

# Outputs
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
