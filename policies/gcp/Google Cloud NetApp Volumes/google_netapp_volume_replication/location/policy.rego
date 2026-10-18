package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_replication.location

import data.terraform.helpers
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
