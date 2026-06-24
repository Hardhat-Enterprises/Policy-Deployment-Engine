package terraform.gcp.security.model_Armor.google_model_armor_floorsetting.enable_floor_setting_enforcement

import data.terraform.helpers
import data.terraform.gcp.security.model_Armor.google_model_armor_floorsetting.vars


conditions := [
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