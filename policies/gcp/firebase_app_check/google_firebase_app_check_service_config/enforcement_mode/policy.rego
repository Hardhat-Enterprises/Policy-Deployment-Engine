package terraform.gcp.security.firebase_app_check.google_firebase_app_check_service_config.enforcement_mode

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_service_config.vars

conditions := [
  [
    {"situation_description" : "Firebase App Check enforcement mode is not set to ENFORCED.",
     "remedies": ["Set enforcement_mode to 'ENFORCED' to actively reject unverified requests."]},
    {
      "condition": "enforcement_mode is not ENFORCED.",
      "attribute_path" : ["enforcement_mode"],
      "values" : ["ENFORCED"],
      "policy_type" : "whitelist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
