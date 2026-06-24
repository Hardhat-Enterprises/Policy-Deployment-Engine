package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.require_csv_headers

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "CSV inventory reports should include headers for readability and auditability",
      "remedies": [
        "Set csv_options.header_required to true"
      ]
    },
    {
      "condition": "CSV headers must be enabled",
      "attribute_path": ["csv_options", 0, "header_required"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details