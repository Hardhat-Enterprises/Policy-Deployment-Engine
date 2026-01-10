package terraform.gcp.security.backup_dr.backup_vault.vault_id

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Backup vault is created with a non-compliant backup_vault_id naming format",
      "remedies": [
        "Update backup_vault_id to match the required pattern: bv-<lowercase letters/numbers/hyphens> (example: bv-prod-backup-01)"
      ]
    },
    {
      "condition": "backup_vault_id must follow the required naming convention",
      "attribute_path": ["backup_vault_id"],
      "values": "^bv-[a-z0-9-]{1,58}$",
      "policy_type": "regex"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


