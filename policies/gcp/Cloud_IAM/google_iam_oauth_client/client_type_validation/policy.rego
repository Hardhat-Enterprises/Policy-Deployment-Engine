package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.client_type_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.vars

conditions := [
  [
    {
      "situation_description": "Only approved OAuth client types are allowed",
      "remedies": ["Use PUBLIC_CLIENT or CONFIDENTIAL_CLIENT"]
    },
    {
      "condition": "Validate client_type",
      "attribute_path": ["address"],
      "values": ["PUBLIC_CLIENT", "CONFIDENTIAL_CLIENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details