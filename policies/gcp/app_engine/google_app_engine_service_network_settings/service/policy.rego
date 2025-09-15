package terraform.gcp.security.app_engine.google_app_engine_service_network_settings.service_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_network_settings.vars

conditions := [
  [
    {
      "situation_description": "App Engine service name must NOT be on the blocked list.",
      "remedies": [
        "Remove blocked service names.",
        "Use an allowed service name instead."
      ]
    },
    {
      "condition": "Service must not be in the blocked list.",
      "attribute_path": ["service"],
      "values": ["insecure-service-nc", "missing-service-nc"],
      "policy_type": "blacklist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
