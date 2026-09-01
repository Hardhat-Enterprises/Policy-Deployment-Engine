package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_model_armor_config_response_template

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require a configured Model Armor response template.

conditions := [
  [
    {
      "situation_description": "Does the assistant configure a Model Armor template to sanitize responses?",
      "remedies": ["Configure customer_policy.model_armor_config.response_template with an organisation-approved Model Armor template."],
    },
    {
      "condition": "Model Armor response template is not configured",
      "attribute_path": ["customer_policy", 0, "model_armor_config", 0, "response_template"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
