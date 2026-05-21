package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.location_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "ocation must be restricted to approved Australia regions for IAM folder policy bindings",
      "remedies": [
        "Set location to an approved Australia region such as australia-southeast1 or australia-southeast2"
      ]
    },
    {
      "condition": "Validate allowed location",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details