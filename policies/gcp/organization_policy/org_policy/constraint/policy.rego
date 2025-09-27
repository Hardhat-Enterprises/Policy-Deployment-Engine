package terraform.gcp.security.organization_policy.org_policy.constraint

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Constraints must be explicitly enforced at the organization or project level",
      "remedies": ["Set enforce = true for the constraint"]
    },
    {
      "condition": "Check if constraint is enforced",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
