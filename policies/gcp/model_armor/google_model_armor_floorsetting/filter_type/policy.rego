package terraform.gcp.security.model_Armor.google_model_armor_floorsetting.filter_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_floorsetting.vars

valid_filter_types := {"DANGEROUS", "VIOLENCE_AND_HATE", "SEXUAL", "TOXICITY"}

conditions := [
  [
    {
      "situation_description": "rai_filters.filter_type must be valid",
      "remedies": ["Ensure filter_type is one of: DANGEROUS, VIOLENCE_AND_HATE, SEXUAL, TOXICITY"]
    },
    {
      "condition": "rai_filters.filter_type must be valid",
      "attribute_path": ["filter_config",0,"rai_settings",0,"rai_filters",0,"filter_type"],
      "values": [t | t := valid_filter_types[_]],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
