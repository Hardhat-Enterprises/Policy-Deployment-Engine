package terraform.gcp.security.organization_policy.disable_sa_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "Service Account key creation must be disabled",
      "remedies": ["Set enforce = true for iam.disableServiceAccountKeyCreation"]
    },
    {
      "condition": "Check if enforce is true",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
