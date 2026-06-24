package terraform.gcp.security.model_Armor.google_model_armor_template.filter_config_pi_and_jailbreak_filter_settings_filter_enforcement

import data.terraform.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_template.vars


conditions := [
    [
    {
      "situation_description": "google model armor template pi_and_jailbreak_filter_settings.filter_enforcement must be ENABLED",
      "remedies": ["Set filter_enforcement = \"ENABLED\" in pi_and_jailbreak_filter_settings"]
    },
    {
      "condition": "google model armor template pi_and_jailbreak_filter_settings.filter_enforcement must not be DISABLED",
      "attribute_path": ["filter_config",0,"pi_and_jailbreak_filter_settings",0,"filter_enforcement"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details