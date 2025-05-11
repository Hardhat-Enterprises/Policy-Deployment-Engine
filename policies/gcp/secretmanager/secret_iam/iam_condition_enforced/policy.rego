package terraform.gcp.security.secretmanager.secret_iam.iam_condition_enforced
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding lacks a condition block",
      "remedies": [ "Add IAM conditions to restrict binding with attributes like expiry or context" ]
    },
    {
      "condition": "Condition block must be present",
      "attribute_path": ["condition"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
