package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.allowed_cloud_storage_locations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "Only approved Cloud Storage locations should be included in the DatasetConfig",
      "remedies": [
        "Use approved Australian Cloud Storage locations only"
      ]
    },
    {
      "condition": "Included Cloud Storage locations must be approved",
      "attribute_path": ["include_cloud_storage_locations", 0, "locations"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details