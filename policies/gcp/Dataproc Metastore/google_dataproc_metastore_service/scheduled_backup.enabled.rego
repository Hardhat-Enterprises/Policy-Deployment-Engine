package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.scheduled_backup_enabled

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.vars

conditions := [
    [
    {
      "situation_description": "Scheduled backups are disabled, enable for data protection",
      "remedies": ["Set scheduled_backup.enabled to true."]
    },
    {
      "condition": "Checks that scheduled backups are disabled.",
      "attribute_path": ["scheduled_backup", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
