package terraform.gcp.security.secret_iam.complex_conditions_enforced

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM Binding is missing condition that enforces expiry AND weekday restriction",
      "remedies": [
        "Add a condition block with timestamp expiry and weekday logic using Common Expression Language (CEL)"
      ]
    },
    {
      "condition": "Condition expression must contain both expiry timestamp and weekday restriction",
      "attribute_path": ["condition", "expression"],
      "values": [
        ["request.time < timestamp"], 
        ["request.time.getDayOfWeek() >= 1"],
        ["request.time.getDayOfWeek() <= 5"]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
