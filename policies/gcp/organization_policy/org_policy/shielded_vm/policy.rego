package terraform.gcp.security.organization_policy.org_policy.shielded_vm

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Shielded VMs must be enabled for all instances",
      "remedies": ["Enable enforce = true for shielded VM policy"]
    },
    {
      "condition": "Check if shielded VMs are enforced",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
