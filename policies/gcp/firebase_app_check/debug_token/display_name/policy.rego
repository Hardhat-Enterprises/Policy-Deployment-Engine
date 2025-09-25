package terraform.gcp.security.firebase_app_check.debug_token.display_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.debug_token.vars



conditions := [
  [
    {
      "situation_description" : "Debug token display name does not meet standards.",
      "remedies": [
        "Ensure the display name has a descriptive value and is not empty."
      ]
    },
    {
      "condition": "The display name should not be empty.",
      "attribute_path" : ["display_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details