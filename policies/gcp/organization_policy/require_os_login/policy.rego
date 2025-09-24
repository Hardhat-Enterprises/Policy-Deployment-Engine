package terraform.gcp.security.organization_policy.require_os_login

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "OS Login must be enforced to use IAM for SSH access",
      "remedies": ["Set enforce = true for compute.requireOsLogin"]
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
