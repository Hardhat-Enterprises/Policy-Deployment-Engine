package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.no_default_service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.no_default_service_account.vars

conditions := [
  [
    {
      "situation_description": "Default App Engine service account is used",
      "remedies": [
        "Create and assign a custom service account with limited roles",
        "Avoid using the 'default' service account"
      ]
    },
    {
      "condition": "Disallow use of default service account",
      "attribute_path": ["service_account"],
      "values": ["default"],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
