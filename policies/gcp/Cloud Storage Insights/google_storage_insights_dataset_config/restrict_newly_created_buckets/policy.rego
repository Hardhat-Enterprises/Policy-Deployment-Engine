package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.restrict_newly_created_buckets

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "Newly created buckets should not be automatically included without review",
      "remedies": [
        "Set include_newly_created_buckets to false",
        "Manually review and approve buckets before including them"
      ]
    },
    {
      "condition": "Automatically including newly created buckets must be disabled",
      "attribute_path": ["include_newly_created_buckets"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details