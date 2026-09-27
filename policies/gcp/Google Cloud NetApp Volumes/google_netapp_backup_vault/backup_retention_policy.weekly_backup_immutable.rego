package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.backup_retention_policy_weekly_backup_immutable

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Weekly backups should be immutable to protect backup data from modification or deletion.",
      "remedies": [
        "Set 'weekly_backup_immutable' to true in the backup_retention_policy block."
      ]
    },
    {
      "condition": "weekly_backup_immutable must be enabled.",
      "attribute_path": ["backup_retention_policy", 0, "weekly_backup_immutable"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details