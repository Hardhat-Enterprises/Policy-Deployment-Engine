package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.source_volume

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

conditions := [
  [
    {"situation_description": "Backups must reference a valid volume in the approved project and AU regions",
     "remedies": [
       "Set source_volume to the full ID, e.g. projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
     ]},
    {
      "condition": "source_volume must be a full resource ID in deakin-lab-123 and AU southeast (1 or 2)",
      "attribute_path": ["source_volume"],
      "values": ["^projects\\/deakin-lab-123\\/locations\\/australia-southeast(1|2)\\/volumes\\/[a-z0-9-]{1,63}$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
