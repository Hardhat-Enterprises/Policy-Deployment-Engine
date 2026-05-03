package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.oauth_scope_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.vars

conditions := [
  [
    {
      "situation_description": "OAuth client must only request approved least-privilege scopes to prevent over-permissioned identity access",
      "remedies": [
        "Remove cloud-platform scope if not strictly required",
        "Prefer openid, email, or groups scopes",
        "Follow least privilege OAuth design"
      ]
    },
    {
      "condition": "Whitelist approved OAuth scopes",
      "attribute_path": ["allowed_scopes"],
      "values": [
        "openid",
        "email",
        "groups"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details