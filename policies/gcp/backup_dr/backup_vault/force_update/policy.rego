package terraform.gcp.security.backup_dr.backup_vault.force_update

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "force_update is not compliant.",
      "remedies": [
        "set force_update to false only"
      ] },
    {
      "condition": "Disable Backup_vault_force_update",
      "attribute_path": ["force_update"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
