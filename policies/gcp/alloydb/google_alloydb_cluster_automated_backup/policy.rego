package terraform.gcp.security.alloydb.google_alloydb_cluster_automated_backup_min_retention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster_automated_backup_min_retention.vars

conditions := [
  [
    {"situation_description": "Automated backups must use a minimum time-based retention.",
     "remedies": ["Set automated_backup_policy.time_based_retention.retention_period to at least 7 days."]},
    {
      "condition": "Retention period must be at least 7 days (accepted durations).",
      "attribute_path": ["automated_backup_policy","time_based_retention","retention_period"],
      "values": ["604800s","1209600s","1814400s","2419200s","2592000s"],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "Backup location must be specified.",
     "remedies": ["Set automated_backup_policy.location to a valid region."]},
    {
      "condition": "Backup location must be non-empty.",
      "attribute_path": ["automated_backup_policy","location"],
      "values": [null,""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
