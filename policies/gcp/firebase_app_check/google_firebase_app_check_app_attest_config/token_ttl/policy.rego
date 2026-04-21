package terraform.gcp.security.firebase_app_check.google_firebase_app_check_app_attest_config.token_ttl

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_app_attest_config.vars

conditions := [
  [
    {"situation_description": "Firebase App Attest token_ttl must be between 1800s (30 min) and 86400s (24 hours) to limit the replay attack window.",
     "remedies": ["Set token_ttl to an accepted value between 1800s and 86400s. Example: '3600s' (1 hour)."]},
    {
      "condition": "token_ttl must be within the permitted range of 1800s to 86400s.",
      "attribute_path": ["token_ttl"],
      "values": ["1800s", "3600s", "7200s", "14400s", "21600s", "43200s", "86400s"],
      "policy_type": "whitelist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
