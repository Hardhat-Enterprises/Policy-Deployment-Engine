package terraform.gcp.security.cloud_spanner.google_spanner_instance.default_backup_schedule_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance does not set default_backup_schedule_type to AUTOMATIC, so new databases are not automatically backed up.",
      "remedies": [
        "Set default_backup_schedule_type = AUTOMATIC on the instance to ensure new databases are backed up automatically."
      ]
    },
    {
      "condition": "default_backup_schedule_type must be AUTOMATIC",
      "attribute_path": ["default_backup_schedule_type"],
      "values": ["AUTOMATIC"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
