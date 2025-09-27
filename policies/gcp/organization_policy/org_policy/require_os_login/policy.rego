package terraform.gcp.security.organization_policy.org_policy.require_os_login

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "VMs must enforce OS Login for IAM-based SSH access",
      "remedies": ["Set enforce = true for require OS Login policy"]
    },
    {
      "condition": "Check if OS Login is enforced",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
