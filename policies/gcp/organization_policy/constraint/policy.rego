package terraform.gcp.security.organization_policy.constraint

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

# Conditions: Ensure constraint is enforced (example: storage.uniformBucketLevelAccess)
conditions := [
  [
    {
      "situation_description": "Organization policy constraint must be enforced",
      "remedies": ["Set enforce = true in the constraint policy"]
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
