package terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.vars

conditions := [
  [
    {
      "situation_description": "Only approved services may use split traffic.",
      "remedies": ["Use an allowlisted service name (e.g., web, api)."]
    },
    {
      "condition": "Service must be in the allowlist.",
      "attribute_path": ["service"],   
      "values": ["web", "api"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Critical services must not use split traffic.",
      "remedies": ["Remove split traffic from critical services (auth, payments, default)."]
    },
    {
      "condition": "Blocklist critical service names.",
      "attribute_path": ["service"],   
      "values": ["auth", "payments", "default"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "migrate_traffic must be enabled for production services.",
      "remedies": ["Set migrate_traffic = true in the split traffic resource."]
    },
    {
      "condition": "migrate_traffic must be true.",
      "attribute_path": ["migrate_traffic"],   
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details,
}
