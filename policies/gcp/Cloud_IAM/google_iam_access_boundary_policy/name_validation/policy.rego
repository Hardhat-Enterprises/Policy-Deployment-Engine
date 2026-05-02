package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.vars

conditions := [
    [
    {
      "situation_description": "Policy name is missing or not properly defined.",
      "remedies": ["Ensure the name parameter is specified and is not empty."]
    },
    {
      "condition": "name is not empty or null",
      "attribute_path": ["name"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details