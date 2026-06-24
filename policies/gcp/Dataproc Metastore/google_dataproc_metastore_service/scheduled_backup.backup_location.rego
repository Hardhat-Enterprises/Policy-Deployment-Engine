package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.scheduled_backup_backup_location

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.vars

conditions := [
    [
    {
      "situation_description": "Ensure storage location follows syntax for Cloud Storage URI's (bucket name syntax)",
      "remedies": ["Change bucket_name to meet the correct syntax requirements"]
    },
    {
      "condition": "Checks that scheduled backups are disabled.",
      "attribute_path": ["scheduled_backup", 0, "backup_location"],
      "values": ["gs://*/folder_name/",[["compliant-project"]]],
      "policy_type": "pattern_whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
