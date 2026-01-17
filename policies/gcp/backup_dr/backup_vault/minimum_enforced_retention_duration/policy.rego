package terraform.gcp.security.backup_dr.backup_vault.minimum_enforced_retention_duration

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Backup vault minimum enforced retention duration is below the approved threshold",
      "remedies": [
        "Increase backup_minimum_enforced_retention_duration to meet the minimum approved value (e.g., >= 100000 seconds)"
      ]
    },
    {
      "condition": "Backup vault must enforce a minimum retention duration",
      "attribute_path": ["backup_minimum_enforced_retention_duration"],
      "values": [100000, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
