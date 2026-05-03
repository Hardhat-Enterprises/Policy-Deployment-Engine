package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.scope_restriction

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.vars

conditions := [
  [
    {
      "situation_description": "OAuth client must not request overly broad scopes",
      "remedies": [
        "Avoid using cloud-platform scope",
        "Use least privilege scopes like email or openid"
      ]
    },
    {
      "condition": "Disallow broad scopes",
      "attribute_path": ["allowed_scopes"],
      "values": ["https://www.googleapis.com/auth/cloud-platform"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details