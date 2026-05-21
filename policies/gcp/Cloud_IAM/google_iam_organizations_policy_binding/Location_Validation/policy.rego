package terraform.gcp.security.Cloud_IAM.google_iam_organizations_policy_binding.location_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_organizations_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Organization policy binding location must be restricted to approved Australia regions",
      "remedies": [
        "Set location to australia-southeast1 or australia-southeast2"
      ]
    },
    {
      "condition": "Validate location whitelist",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details