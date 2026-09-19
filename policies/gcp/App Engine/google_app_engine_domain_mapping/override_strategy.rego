package terraform.gcp.security.app_engine.google_app_engine_domain_mapping.override_strategy

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_domain_mapping.vars

conditions := [
  [
    {
      "situation_description": "override_strategy is invalid",
      "remedies": ["Ensure that override_strategy is set to 'STRICT'"]
    },
    {
      "condition": "Check that override_strategy is valid",
      "attribute_path": ["override_strategy"],
      "values": ["STRICT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details