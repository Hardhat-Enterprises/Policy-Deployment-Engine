package terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.force_destroy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_report_config.vars

conditions := [
  [
    {
      "situation_description": "Force destroy should not be enabled because it may delete report details",
      "remedies": [
        "Set force_destroy to false"
      ]
    },
    {
      "condition": "Force destroy must be disabled",
      "attribute_path": ["force_destroy"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
