package terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.location_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Project policy binding must use global location only",
      "remedies": ["Set location = global"]
    },
    {
      "condition": "Validate location whitelist",
      "attribute_path": ["address"],
      "values": ["global"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details