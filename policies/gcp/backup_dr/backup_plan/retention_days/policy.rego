package terraform.gcp.security.backup_dr.backup_plan.retention_days

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_plan.vars

conditions := [
  [
    {
      "situation_description": "Backup plan retention days is outside the approved range",
      "remedies": [
        "Set backup_retention_days to an approved value (e.g., between 7 and 365 days)"
      ]
    },
    {
      "condition": "Backup plan backup_retention_days must be between 7 and 365",
      "attribute_path": ["backup_rules", 0, "backup_retention_days"],
      "values": [7, 365],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
