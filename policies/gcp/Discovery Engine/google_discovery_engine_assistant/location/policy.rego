package terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.location

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_assistant.vars

# Restrict assistants to approved geographic locations.

conditions := [
  [
    {
      "situation_description": "Is the Discovery Engine assistant deployed in an approved location?",
      "remedies": ["Set location to an approved region, such as eu."]
    },
    {
      "condition": "location is not approved",
      "attribute_path": ["location"],
      "values": ["eu"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details