package terraform.gcp.security.model_Armor.google_model_armor_floorsetting.filter_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_floorsetting.vars


conditions := [
  [
    {
      "situation_description": "filter_config cannot be empty, must define at least one category!",
      "remedies": ["Ensure at least one filter_config block is defined with proper categories"]
    },
    {
      "condition": "filter_config must not be completely empty",
      "attribute_path": ["filter_config",0],
      "values": [
        {"malicious_uri_filter_settings":[],"pi_and_jailbreak_filter_settings":[],"rai_settings":[],"sdp_settings":[]}
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
