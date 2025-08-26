package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

conditions := [
  [
    {"situation_description": "Backups must stay in approved Australia regions",
     "remedies": ["Set location to \"australia-southeast1\" (Sydney) or \"australia-southeast2\" (Melbourne)."]},
    {
      "condition": "location must be an approved AU region",
      "attribute_path": ["location"],
      "values": ["^australia-southeast(1|2)$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
