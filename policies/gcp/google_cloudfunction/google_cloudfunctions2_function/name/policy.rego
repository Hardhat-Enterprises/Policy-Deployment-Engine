package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars


conditions := [
  [
    {
      "situation_description": "Function name is missing or empty, which violates naming requirements.",
      "remedies": [
        "Set the 'name' attribute in your Terraform configuration."
      ]
    },
    {
      "condition": "Function name must not be empty.",
      "attribute_path": ["name"],
      "values": [],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details