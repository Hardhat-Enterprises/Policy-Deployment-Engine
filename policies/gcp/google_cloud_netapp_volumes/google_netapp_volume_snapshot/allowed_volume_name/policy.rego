package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_snapshot.allowed_volume_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_snapshot.vars

conditions := [
  [
    {
      "situation_description": "Snapshots must target approved volumes",
      "remedies": ["Set volume_name to one of the approved volumes."]
    },
    {
      "condition": "volume_name equals an approved volume",
      "attribute_path": ["volume_name"],
      "values": ["backup-volume", "prod-volume-1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
