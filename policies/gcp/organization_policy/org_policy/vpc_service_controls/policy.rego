package terraform.gcp.security.organization_policy.org_policy.vpc_service_controls

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "VPC Service Controls must be enforced to prevent data exfiltration",
      "remedies": ["Set enforce = true to enable VPC Service Controls"]
    },
    {
      "condition": "Check if VPC Service Controls are enforced",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
