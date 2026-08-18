package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "Storage Insights DatasetConfig should be created only in approved Australian regions",
      "remedies": [
        "Use australia-southeast1 or australia-southeast2 as the DatasetConfig location"
      ]
    },
    {
      "condition": "DatasetConfig location must be an approved Australian region",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
