package terraform.gcp.security.model_armor.google_model_armor_template.location

import data.terraform.helpers
import data.terraform.gcp.security.model_armor.google_model_armor_template.vars

# Condition: location must always be "global"
conditions := [
  [
    {
      "situation_description": "google_model_armor_template location must be 'global'",
      "remedies": ["Set location = 'global' to ensure consistent global enforcement"]
    },
    {
      "condition": "google_model_armor_template location must be global",
      "attribute_path": ["location"],
      "values": ["global"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
