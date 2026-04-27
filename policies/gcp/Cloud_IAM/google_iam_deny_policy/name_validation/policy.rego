package terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.vars

conditions := [
  [
    {
      "situation_description": "Deny policy name is not following naming convention",
      "remedies": ["Use prefix 'pde-' for deny policies"]
    },
    {
      "condition": "Validate deny policy name",
      "attribute_path": ["address"],
      "values": ["pde-*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details