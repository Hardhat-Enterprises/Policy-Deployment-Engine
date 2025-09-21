package terraform.gcp.security.model_Armor.google_model_armor_template.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_template.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
