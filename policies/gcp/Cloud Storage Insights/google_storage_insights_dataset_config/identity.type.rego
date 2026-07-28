package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.identity_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "DatasetConfig should use a dedicated per-config identity",
      "remedies": [
        "Use IDENTITY_TYPE_PER_CONFIG to reduce shared identity risk"
      ]
    },
    {
      "condition": "Identity type must be per config",
      "attribute_path": ["identity", 0, "type"],
      "values": ["IDENTITY_TYPE_PER_CONFIG"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
