package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding has an invalid or empty member",
      "remedies": [
        "Add a valid `member` identity such as `serviceAccount:<sa>@<project>.iam.gserviceaccount.com` or `user:<user>@example.com`"
      ]
    },
    {
      "condition": "`member` must not be empty",
      "attribute_path": ["member"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
