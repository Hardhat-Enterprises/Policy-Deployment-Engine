package terraform.gcp.security.model_Armor.google_model_armor_template.filter_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_template.vars



conditions := [
  [
    {
      "situation_description": "rai_filters.filter_type must be valid",
      "remedies": ["Ensure filter_type is one of: DANGEROUS, VIOLENCE_AND_HATE, SEXUAL, TOXICITY"]
    },
    {
      "condition": "rai_filters.filter_type must be valid",
      "attribute_path": ["filter_config",0,"rai_settings",0,"rai_filters",0,"filter_type"],
      "values": ["DANGEROUS", "VIOLENCE_AND_HATE", "SEXUAL", "TOXICITY"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
