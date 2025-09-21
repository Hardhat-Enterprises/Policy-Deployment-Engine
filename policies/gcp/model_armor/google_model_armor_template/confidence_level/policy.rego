package terraform.gcp.security.model_Armor.google_model_armor_template.confidence_level

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_template.vars


conditions := [
[
    {
      "situation_description": "template rai_filters.confidence_level must be valid",
      "remedies": ["Ensure template confidence_level is one of: LOW_AND_ABOVE, MEDIUM_AND_ABOVE, HIGH_ONLY"]
    },
    {
      "condition": "template rai_filters.confidence_level must be valid",
      "attribute_path": ["filter_config",0,"rai_settings",0,"rai_filters",0,"confidence_level"],
      "values": ["LOW_AND_ABOVE", "MEDIUM_AND_ABOVE","HIGH_ONLY"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "template confidence_level minimal requirement",
      "remedies": ["Ensure template confidence_level require at least MEDIUM_AND_ABOVE"]
    },
    {
      "condition": "template confidence_level minimal requirement",
      "attribute_path": ["filter_config",0,"rai_settings",0,"rai_filters",0,"confidence_level"],
      "values": ["MEDIUM_AND_ABOVE","HIGH_ONLY"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
