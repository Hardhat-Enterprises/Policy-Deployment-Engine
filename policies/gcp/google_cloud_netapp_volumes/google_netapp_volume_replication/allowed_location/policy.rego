package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_replication.allowed_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_replication.vars

conditions := [
  [
    {
      "situation_description": "Replication must be in approved Australia regions",
      "remedies": ["Use australia-southeast1 (Sydney) or australia-southeast2 (Melbourne)."]
    },
    {
      "condition": "location must be australia-southeast1 or australia-southeast2",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
