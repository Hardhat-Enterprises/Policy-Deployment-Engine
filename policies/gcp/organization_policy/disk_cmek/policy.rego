package terraform.gcp.security.organization_policy.disk_cmek

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "Disks must use customer-managed encryption keys (CMEK)",
      "remedies": ["Restrict org policy to enforce CMEK usage"]
    },
    {
      "condition": "Check if enforce is true",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
