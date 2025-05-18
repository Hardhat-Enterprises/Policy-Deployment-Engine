package terraform.gcp.security.secret_iam.iam_condition_enforced

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding lacks a secure condition expression",
      "remedies": [ "Add a condition expression (e.g., expiry or context restriction) to the IAM binding" ]
    },
    {
      "condition": "IAM binding must contain a valid condition expression",
      "attribute_path": ["condition", "expression"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
