package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_model_armor_config_failure_mode

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require Model Armor to fail closed.

conditions := [
  [
    {
      "situation_description": "Does Model Armor block content when sanitization fails?",
      "remedies": ["Set customer_policy.model_armor_config.failure_mode to FAIL_CLOSED."]
    },
    {
      "condition": "Model Armor failure mode is not secure",
      "attribute_path": ["customer_policy", "model_armor_config", "failure_mode"],
      "values": ["FAIL_CLOSED"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details