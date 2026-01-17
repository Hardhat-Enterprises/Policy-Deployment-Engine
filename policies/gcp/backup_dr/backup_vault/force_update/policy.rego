package terraform.gcp.security.backup_dr.backup_vault.force_update

import data.terraform.helpers
import data.terraform.gcp.security.backup_dr.backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Backup vault is configured with force_update enabled",
      "remedies": [
        "Set force_update to false to avoid unintended forced updates"
      ]
    },
    {
      "condition": "Backup vault force_update must be disabled",
      "attribute_path": ["force_update"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
