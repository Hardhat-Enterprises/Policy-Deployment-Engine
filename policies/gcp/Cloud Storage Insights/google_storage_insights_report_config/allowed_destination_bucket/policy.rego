package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.allowed_destination_bucket

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Inventory reports should be stored only in approved destination buckets",
      "remedies": [
        "Use an approved secure destination bucket"
      ]
    },
    {
      "condition": "Destination bucket must be approved",
      "attribute_path": ["object_metadata_report_options", 0, "storage_destination_options", 0, "bucket"],
      "values": ["secure-report-bucket", "audit-report-bucket"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details