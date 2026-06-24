package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.object_metadata_report_options_storage_destination_options_destination_path

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Inventory reports should be stored in an approved destination path",
      "remedies": [
        "Use storage-insights-reports as the destination path"
      ]
    },
    {
      "condition": "Destination path must be approved",
      "attribute_path": ["object_metadata_report_options", 0, "storage_destination_options", 0, "destination_path"],
      "values": ["storage-insights-reports"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
