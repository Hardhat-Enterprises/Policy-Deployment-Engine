package terraform.gcp.security.discovery_engine.google_discovery_engine_control.location

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_control.vars

# Restrict the resource to approved data-residency locations.

conditions := [
  [
    {
      "situation_description": "Is the Discovery Engine control located in an approved region?",
      "remedies": ["Set location to an approved value such as us or eu."]
    },
    {
      "condition": "location is not approved",
      "attribute_path": ["location"],
      "values": ["us", "eu"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details