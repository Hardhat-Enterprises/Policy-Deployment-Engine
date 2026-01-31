package terraform.gcp.security.alloydb.google_alloydb_cluster.automated_backup_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [
  [
    {
      "situation_description": "Automated backups must use a minimum time-based retention.",
      "remedies": ["Set automated_backup_policy.time_based_retention.retention_period to at least 7 days."],
    },
    {
      "condition": "Retention period must be at least 7 days.",
      "attribute_path": ["automated_backup_policy", "time_based_retention", "retention_period"],
      "values": [604800],
      "policy_type": "min",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
