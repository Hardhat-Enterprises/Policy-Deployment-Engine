package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.display_name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.vars

conditions := [
  [
    {
      "situation_description": "OAuth client display_name must be 1–32 characters",
      "remedies": [
        "Provide display_name",
        "Ensure length ≤ 32 characters"
      ]
    },
    {
      "condition": "Validate display_name format",
      "attribute_path": ["display_name"],
      "values": ["^.{1,32}$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details