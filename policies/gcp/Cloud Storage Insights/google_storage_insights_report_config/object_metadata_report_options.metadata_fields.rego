package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.object_metadata_report_options_metadata_fields

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Inventory reports should include only approved metadata fields",
      "remedies": [
        "Use only approved metadata fields such as bucket, name, and project"
      ]
    },
    {
      "condition": "Metadata fields must be from the approved list",
      "attribute_path": ["object_metadata_report_options", 0, "metadata_fields"],
      "values": ["bucket", "name", "project"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
