package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_model_armor_config_response_template

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require an approved Model Armor response template.

conditions := [
  [
    {
      "situation_description": "Does the assistant sanitize responses using an approved Model Armor template?",
      "remedies": ["Set customer_policy.model_armor_config.response_template to the approved response template."]
    },
    {
      "condition": "Model Armor response template is not approved",
      "attribute_path": ["customer_policy", 0, "model_armor_config", 0, "response_template"],
      "values": [
                "projects/[^/]+/locations/eu/templates/*",
                [["approved-response-template"]]
            ],
            "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details