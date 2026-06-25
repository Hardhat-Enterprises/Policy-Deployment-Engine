package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.link_dataset

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "Dataset should not be automatically linked without approval",
      "remedies": [
        "Set link_dataset to false",
        "Link datasets only after access and exposure risks are reviewed"
      ]
    },
    {
      "condition": "Dataset auto-linking must be disabled",
      "attribute_path": ["link_dataset"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
