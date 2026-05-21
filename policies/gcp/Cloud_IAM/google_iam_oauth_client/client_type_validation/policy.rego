package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.client_type_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.vars

conditions := [
  [
    {
      "situation_description": "OAuth clients must use approved secure client types",
      "remedies": [
        "Use PUBLIC_CLIENT or CONFIDENTIAL_CLIENT",
        "Do not use CLIENT_TYPE_UNSPECIFIED"
      ]
    },
    {
      "condition": "Validate client_type",
      "attribute_path": ["client_type"],
      "values": ["PUBLIC_CLIENT", "CONFIDENTIAL_CLIENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details