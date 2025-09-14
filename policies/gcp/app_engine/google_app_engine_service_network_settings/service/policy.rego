package terraform.gcp.security.app_engine.google_app_engine_service_network_settings.service_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_network_settings.vars

conditions := [
  [
    {
      "situation_description": "App Engine service name must be from the approved allowlist.",
      "remedies": [
        "Use one of the approved service names such as 'approved-service'.",
        "Remove or replace any unapproved service values."
      ]
    },
    {
      "condition": "Service must be in the approved list.",
      "attribute_path": ["service"],
      "values": ["approved-service"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
