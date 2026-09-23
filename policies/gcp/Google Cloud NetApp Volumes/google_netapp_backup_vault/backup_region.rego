package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.backup_region

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.vars

conditions := [
  [
    {
      "situation_description": "Backup data must be stored in an approved Australian region.",
      "remedies": [
        "Set 'backup_region' to an approved Australian region."
      ]
    },
    {
      "condition": "backup_region must be within an approved Australian region.",
      "attribute_path": ["backup_region"],
      "values": [
        "australia-southeast1",
        "australia-southeast2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details