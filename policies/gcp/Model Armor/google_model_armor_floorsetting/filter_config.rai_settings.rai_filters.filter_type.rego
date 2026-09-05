package terraform.gcp.security.model_armor.google_model_armor_floorsetting.filter_config_rai_settings_rai_filters_filter_type

import data.terraform.helpers
import data.terraform.gcp.security.model_armor.google_model_armor_floorsetting.vars


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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
