package terraform.gcp.security.organization_policy.org_policy.vm_no_external_ip

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "VMs must not have external IP addresses for security reasons",
      "remedies": ["Set enforce = true to disallow external IPs"]
    },
    {
      "condition": "Check if external IPs are disallowed",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
