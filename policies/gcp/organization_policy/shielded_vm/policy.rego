package terraform.gcp.security.organization_policy.shielded_vm

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "Shielded VM must be enabled for stronger security",
      "remedies": ["Set enforce = true for compute.requireShieldedVm"]
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
