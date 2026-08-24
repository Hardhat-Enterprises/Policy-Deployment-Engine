package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.customer_policy_banned_phrases_ignore_diacritics

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Require diacritic-insensitive banned-phrase matching.

conditions := [
  [
    {
      "situation_description": "Does banned-phrase matching ignore diacritical marks?",
      "remedies": ["Set customer_policy.banned_phrases.ignore_diacritics to true."]
    },
    {
      "condition": "banned-phrase matching does not ignore diacritics",
      "attribute_path": ["customer_policy", 0, "banned_phrases", 0, "ignore_diacritics"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details