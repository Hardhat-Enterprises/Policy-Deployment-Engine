package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.location_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client_credential.location_validation.vars

conditions := [
  [
    {
      "situation_description": "OAuth client credential must use global location only",
      "remedies": ["Set location = global"]
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