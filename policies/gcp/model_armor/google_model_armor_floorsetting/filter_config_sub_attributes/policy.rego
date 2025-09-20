package terraform.gcp.security.model_Armor.google_model_armor_floorsetting.filter_config_sub_attributes

import data.terraform.gcp.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_floorsetting.vars


conditions := [
  [
    {
      "situation_description": "malicious_uri_filter_settings.filter_enforcement must be ENABLED",
      "remedies": ["Set filter_enforcement = \"ENABLED\" in malicious_uri_filter_settings"]
    },
    {
      "condition": "malicious_uri_filter_settings.filter_enforcement must not be DISABLED",
      "attribute_path": ["filter_config",0,"malicious_uri_filter_settings",0,"filter_enforcement"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "pi_and_jailbreak_filter_settings.filter_enforcement must be ENABLED",
      "remedies": ["Set filter_enforcement = \"ENABLED\" in pi_and_jailbreak_filter_settings"]
    },
    {
      "condition": "pi_and_jailbreak_filter_settings.filter_enforcement must not be DISABLED",
      "attribute_path": ["filter_config",0,"pi_and_jailbreak_filter_settings",0,"filter_enforcement"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "sdp_settings.basic_config.filter_enforcement must be ENABLED",
      "remedies": ["Set filter_enforcement = \"ENABLED\" in sdp_settings.basic_config"]
    },
    {
      "condition": "sdp_settings.basic_config.filter_enforcement must not be DISABLED",
      "attribute_path": ["filter_config",0,"sdp_settings",0,"basic_config",0,"filter_enforcement"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
  ],
   [
    {
      "situation_description": "enable_floor_setting_enforcement must be true",
      "remedies": ["Set enable_floor_setting_enforcement = true"]
    },
    {
      "condition": "enable_floor_setting_enforcement must equal true",
      "attribute_path": ["enable_floor_setting_enforcement"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
