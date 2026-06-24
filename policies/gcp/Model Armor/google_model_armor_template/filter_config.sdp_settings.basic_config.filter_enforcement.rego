package terraform.gcp.security.model_Armor.google_model_armor_template.filter_config_sdp_settings_basic_config_filter_enforcement

import data.terraform.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_template.vars


conditions := [
    [
    {
      "situation_description": "google model armor template sdp_settings.basic_config.filter_enforcement must be ENABLED",
      "remedies": ["Set filter_enforcement = \"ENABLED\" in sdp_settings.basic_config"]
    },
    {
      "condition": "google model armor template sdp_settings.basic_config.filter_enforcement must not be DISABLED",
      "attribute_path": ["filter_config",0,"sdp_settings",0,"basic_config",0,"filter_enforcement"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details