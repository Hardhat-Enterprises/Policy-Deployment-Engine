package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_quota_rule.disk_limit_mib_range

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_volume_quota_rule.vars

conditions := [
  [
    {"situation_description": "Quota limit must be sensible",
     "remedies": ["Set disk_limit_mib between 1024 and 1048576 (adjust as needed)."]},
    {
      "condition": "disk_limit_mib within range",
      "attribute_path": ["disk_limit_mib"],
      "values": [1024, 1048576],   # min, max in MiB
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
