package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.ingress

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

conditions := [
  [
    {
      "situation_description": "Function ingress setting allows public access, which violates security best practices.",
      "remedies": [
        "Set 'ingress_settings' to 'ALLOW_INTERNAL_ONLY'."
      ]
    },
    {
      "condition": "Function ingress must not allow public access.",
      "attribute_path": ["service_config", 0, "ingress_settings"],
      "values": ["ALLOW_INTERNAL_ONLY"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details