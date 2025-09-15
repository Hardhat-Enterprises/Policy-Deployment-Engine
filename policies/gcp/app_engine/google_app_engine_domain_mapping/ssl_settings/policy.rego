package terraform.gcp.security.app_engine.google_app_engine_domain_mapping.ssl_settings

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_domain_mapping.vars

conditions := [
  [
    {
      "situation_description": "App Engine domain mapping does not have SSL enabled",
      "remedies": [
        "Enable SSL management by setting ssl_management_type to AUTOMATIC or MANUAL",
        "Ensure all domain mappings use secure HTTPS connections"
      ]
    },
    {
      "condition": "SSL management type is AUTOMATIC or MANUAL",
      "resource_value_name": "domain_name",
      "attribute_path": ["ssl_settings", 0, "ssl_management_type"],
      "values": ["AUTOMATIC", "MANUAL"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
