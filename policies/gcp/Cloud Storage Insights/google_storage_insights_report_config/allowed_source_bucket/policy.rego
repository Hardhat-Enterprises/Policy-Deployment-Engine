package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.allowed_source_bucket

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Inventory reports should only be generated from approved source buckets",
      "remedies": [
        "Use only approved source buckets in storage_filters.bucket",
        "Avoid using unapproved or public buckets as data sources"
      ]
    },
    {
      "condition": "Source bucket must be from approved list",
      "attribute_path": ["object_metadata_report_options", 0, "storage_filters", 0, "bucket"],
      "values": ["approved-source-bucket", "audit-source-bucket"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details