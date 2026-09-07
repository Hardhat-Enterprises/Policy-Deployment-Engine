package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_policy.daily_backup_limit

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_policy.vars

conditions := [
  [
    {"situation_description": "Daily retention must be at least 2 backups",
     "remedies": ["Set daily_backup_limit to 2 or more (e.g., 7)."]},
    {
      "condition": "daily_backup_limit must be >= 2",
      "attribute_path": ["daily_backup_limit"],
      "values": [2, 365],        # integers (min, max)
      "policy_type": "range"     # enforces numeric range
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
