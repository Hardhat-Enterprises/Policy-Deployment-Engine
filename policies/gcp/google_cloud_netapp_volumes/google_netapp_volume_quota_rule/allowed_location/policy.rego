package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_quota_rule.allowed_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_quota_rule.vars

conditions := [
  [
    {
      "situation_description": "Cloud is within australia region",
      "remedies": ["Use Australian regions"]
    },
    {
      "condition": "c1 location is either australia-southeast1 or australia-southeast2",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
