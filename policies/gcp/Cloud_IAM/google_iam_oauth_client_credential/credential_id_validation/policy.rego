package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.credential_id_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.vars

conditions := [
  [
    {
      "situation_description": "Credential ID must follow secure naming rules (4–32 chars, lowercase, digits, hyphen allowed)",
      "remedies": [
        "Use lowercase letters, numbers, hyphens",
        "Length 4–32 characters",
        "Do not use gcp- prefix"
      ]
    },
    {
      "condition": "Validate oauth_client_credential_id format",
      "attribute_path": ["oauth_client_credential_id"],
      "values": ["^[a-z][a-z0-9-]{2,30}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details