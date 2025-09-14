package terraform.gcp.security.app_engine.google_app_engine_domain_mapping.ssl_settings

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_domain_mapping.vars


local_vars := {
  "friendly_resource_name": vars.variables.friendly_resource_name,
  "resource_type":          vars.variables.resource_type,
  "resource_value_name":    "domain_name"
}


conditions := [
  [
    {
      "situation_description": "SSL management type must be AUTOMATIC",
      "remedies": [
        "Set ssl_settings.ssl_management_type to AUTOMATIC so Google manages SSL certificates"
      ]
    },
    {
      "condition":      "Ensure AUTOMATIC SSL management",
      "attribute_path": ["ssl_settings", 0, "ssl_management_type"],  # relative to .values
      "values":         ["AUTOMATIC"],
      "policy_type":    "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, local_vars).message
details := helpers.get_multi_summary(conditions, local_vars).details
