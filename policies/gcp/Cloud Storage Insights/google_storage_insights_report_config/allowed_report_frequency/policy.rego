package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.allowed_report_frequency

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Inventory reports should not be generated too frequently unless approved",
      "remedies": [
        "Use WEEKLY report frequency to reduce unnecessary report generation and data exposure"
      ]
    },
    {
      "condition": "Report frequency must be WEEKLY",
      "attribute_path": ["frequency_options", 0, "frequency"],
      "values": ["WEEKLY"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details