package terraform.gcp.security.backup_dr.backup_plan.retention_days

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Retention days is not compliant.",
      "remedies": [
        "Set Retention_days to an approved value (7 to 365 days)"
      ] },
    {
      "condition": "Retention_days must be between 7 and 365",
      "attribute_path": ["backup_rules", 0, "backup_retention_days"],
      "values": [7, 365],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
