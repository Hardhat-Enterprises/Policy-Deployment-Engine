package terraform.gcp.security.organization_policy.org_policy.disk_cmek

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Disks must use Customer-Managed Encryption Keys (CMEK)",
      "remedies": ["Ensure enforce = true for disk CMEK policy"]
    },
    {
      "condition": "Check if CMEK enforcement is enabled",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
