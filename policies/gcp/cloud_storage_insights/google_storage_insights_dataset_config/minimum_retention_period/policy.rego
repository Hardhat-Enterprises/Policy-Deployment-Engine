package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.minimum_retention_period

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "DatasetConfig retention period is too short for auditing and investigation",
      "remedies": [
        "Set retention_period_days to at least 30 days"
      ]
    },
    {
      "condition": "Retention period must be at least 30 days",
      "attribute_path": ["retention_period_days"],
      "values": [30, null],
      "policy_type": "range"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details