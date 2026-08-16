package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.backup_operators

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "Backup Operator assignments must not use overly broad or wildcard principals.",
      "remedies": [
        "Remove wildcard, generic, or overly broad Backup Operator principals and use explicitly authorised users or groups."
      ]
    },
    {
      "condition": "backup_operators must not contain broad or wildcard principals.",
      "attribute_path": ["backup_operators"],
      "values": ["*", "everyone", "all", "domain users"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details