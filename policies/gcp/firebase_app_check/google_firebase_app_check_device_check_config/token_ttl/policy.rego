package terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.token_ttl

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.vars

conditions := [
  [
    {"situation_description": "Firebase DeviceCheck token_ttl must not exceed 86400s (24 hours) to limit the replay attack window.",
     "remedies": ["Set token_ttl to 86400s or less. Example: '3600s' (1 hour)."]},
    {
      "condition": "token_ttl exceeds the maximum permitted value of 86400s.",
      "attribute_path": ["token_ttl"],
      "values": ["604800s", "86401s"],
      "policy_type": "blacklist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
