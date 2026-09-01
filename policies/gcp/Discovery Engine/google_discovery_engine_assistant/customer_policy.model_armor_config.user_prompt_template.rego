package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_model_armor_config_user_prompt_template

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require an approved Model Armor user-prompt template.

conditions := [
  [
    {
      "situation_description": "Does the assistant sanitize user prompts using an approved Model Armor template?",
      "remedies": ["Set customer_policy.model_armor_config.user_prompt_template to the approved prompt template."]
    },
    {
      "condition": "Model Armor user-prompt template is not approved",
      "attribute_path": ["customer_policy", 0, "model_armor_config", 0, "user_prompt_template"],
      "values": [
                "projects/*/locations/eu/templates/*",
                [["735927692082"], ["approved-prompt-template"]]
            ],
            "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details