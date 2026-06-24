package terraform.gcp.security.app_engine.app_engine_domain_mapping.ssl_settings.ssl_management_type

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_domain_mapping.vars

conditions := [
  [
    {
      "situation_description": "SSL management type is invalid",
      "remedies": ["Set ssl_management_type to 'AUTOMATIC'"]
    },
    {
      "condition": "Check ssl_management_type is valid",
      "attribute_path": ["ssl_settings", 0, "ssl_management_type"],
      "values": ["AUTOMATIC"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details