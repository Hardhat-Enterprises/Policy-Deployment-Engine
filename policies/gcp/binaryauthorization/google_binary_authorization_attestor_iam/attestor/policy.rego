package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.attestor

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding is missing attestor",
      "remedies": [
        "Set the `attestor` field in google_binary_authorization_attestor_iam_member"
      ]
    },
    {
      "condition": "`attestor` must be specified and non-empty",
      "attribute_path": ["attestor"],
      "values": [null, ""],        # mark null or empty as violations
      "policy_type": "blacklist"   # blacklist invalid cases
    }
  ]
]

# General summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
