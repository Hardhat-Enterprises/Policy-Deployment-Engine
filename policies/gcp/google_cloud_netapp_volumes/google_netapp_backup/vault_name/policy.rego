package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vault_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

conditions := [
  [
    {"situation_description": "Backups must use an approved naming convention",
     "remedies": ["Use a name like \"bk-prod-australia-southeast2\""]},
    {
      "condition": "vault_name matches convention (bk-…)",
      "attribute_path": ["vault_name"],
      "values": ["^bk-[a-z0-9-]{3,30}$"],
      "policy_type": "pattern whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
