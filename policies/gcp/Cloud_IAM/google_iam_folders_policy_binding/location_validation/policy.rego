package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.location_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.location_validation.vars

conditions := [
  [
    {
      "situation_description": "Location must strictly be global for IAM folder policy bindings",
      "remedies": [
        "Set location = global"
      ]
    },
    {
      "condition": "Validate allowed location",
      "attribute_path": ["location"],
      "values": ["global"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details