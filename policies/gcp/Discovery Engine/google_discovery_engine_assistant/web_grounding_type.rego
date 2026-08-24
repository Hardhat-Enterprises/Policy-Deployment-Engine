package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.web_grounding_type

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Restrict assistants to approved web-grounding configurations.

conditions := [
  [
    {
      "situation_description": "Does the Discovery Engine assistant use an approved web-grounding configuration?",
      "remedies": ["Disable external web grounding unless an approved source is required."]
    },
    {
      "condition": "web_grounding_type is not approved",
      "attribute_path": ["web_grounding_type"],
      "values": ["WEB_GROUNDING_TYPE_DISABLED"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details