package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_replication.required_replication_schedule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_replication.vars

conditions := [
  [
    {
      "situation_description": "Replication schedule must meet the required frequency",
      "remedies": ["Set replication_schedule to \"EVERY_10_MINUTES\"."]
    },
    {
      "condition": "replication_schedule is EVERY_10_MINUTES",
      "attribute_path": ["replication_schedule"],
      "values": ["EVERY_10_MINUTES"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
