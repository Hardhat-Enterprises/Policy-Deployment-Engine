package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_banned_phrases_match_type

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require an approved banned-phrase matching mode.

conditions := [
  [
    {
      "situation_description": "Does the assistant use an approved banned-phrase matching mode?",
      "remedies": ["Set customer_policy.banned_phrases.match_type to WORD_BOUNDARY_STRING_MATCH."]
    },
    {
      "condition": "banned-phrase match type is not approved",
      "attribute_path": ["customer_policy", 0, "banned_phrases", 0, "match_type"],
      "values": ["WORD_BOUNDARY_STRING_MATCH"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details