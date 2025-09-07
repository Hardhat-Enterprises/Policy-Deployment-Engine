package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding has no members defined",
      "remedies": [
        "Add a valid `member` identity such as a service account"
      ]
    },
    {
      "condition": "`member` must be non-empty and valid",
      "attribute_path": ["member"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
