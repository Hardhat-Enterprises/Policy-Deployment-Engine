package terraform.gcp.security.organization_policy.org_policy.nested_virtualization

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Nested virtualization must be disabled to avoid performance and security risks",
      "remedies": ["Set enforce = true to disallow nested virtualization"]
    },
    {
      "condition": "Check if nested virtualization is disabled",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
