package terraform.gcp.security.organization_policy.vm_no_external_ip

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "VMs must not have external IPs",
      "remedies": ["Enforce compute.vmCanIpForward = false"]
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
