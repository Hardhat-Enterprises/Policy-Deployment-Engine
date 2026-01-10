package terraform.gcp.security.backup_dr.backup_vault.access_restriction

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Backup vault access restriction is not set to an approved value",
      "remedies": [
        "Set access_restriction to WITHIN_ORGANIZATION"
      ]
    },
    {
      "condition": "Backup vault must restrict access within the organization",
      "attribute_path": ["access_restriction"],
      "values": ["WITHIN_ORGANIZATION"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
