package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.organization_scope

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

conditions := [
  [
    {
      "situation_description": "Organization-wide scope can collect data from too many projects",
      "remedies": [
        "Set organization_scope to false unless organisation-wide monitoring is formally approved"
      ]
    },
    {
      "condition": "Organization scope must not be enabled",
      "attribute_path": ["organization_scope"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
