package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.location

import data.terraform.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars


conditions := [
  [
    {
      "situation_description": "Function location  is missing or empty, which violates requirements.",
      "remedies": [
        "Set the 'location' attribute in your Terraform configuration."
      ]
    },
    {
      "condition": "Function location must not be empty.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details