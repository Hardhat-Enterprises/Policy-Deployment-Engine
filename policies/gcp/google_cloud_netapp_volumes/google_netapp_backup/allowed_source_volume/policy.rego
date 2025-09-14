package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.allowed_source_volume

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

conditions := [
  [
    {
      "situation_description": "Backups must reference an approved volume in the Deakin project and AU regions",
      "remedies": [
        "Set source_volume to one of the approved full IDs below."
      ]
    },
    {
      "condition": "source_volume equals an approved volume ID",
      "attribute_path": ["source_volume"],
      "values": [
        "projects/deakin-lab-123/locations/australia-southeast1/volumes/backup-volume",
        "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
