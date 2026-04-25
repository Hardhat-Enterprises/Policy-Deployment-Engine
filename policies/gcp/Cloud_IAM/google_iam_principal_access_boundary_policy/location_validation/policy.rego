package terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.location_validation
import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_principal_access_boundary_policy.location_validation.vars

conditions := [
  [
    {
      "situation_description": "Location must always be global for PAB policy",
      "remedies": [
        "Set location = global"
      ]
    },
    {
      "condition": "Validate location whitelist",
      "attribute_path": ["location"],
      "values": ["global"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details