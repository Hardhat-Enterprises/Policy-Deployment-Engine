package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_model_armor_config_user_prompt_template

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require a structurally valid Model Armor user-prompt-template reference.
conditions := [
  [
    {
      "situation_description": "Does the assistant use a structurally valid Model Armor user-prompt-template resource path?",
      "remedies": ["Set customer_policy.model_armor_config.user_prompt_template using the projects/{project}/locations/{location}/templates/{template_id} structure."]
    },
    {
      "condition": "Model Armor user-prompt-template reference must use a valid resource path",
      "attribute_path": ["customer_policy", 0, "model_armor_config", 0, "user_prompt_template"],
      "values": ["projects/*/locations/*/templates/*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
