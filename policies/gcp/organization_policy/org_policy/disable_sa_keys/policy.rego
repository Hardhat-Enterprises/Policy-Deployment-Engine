package terraform.gcp.security.organization_policy.org_policy.disable_sa_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Service account key creation must be disabled for security",
      "remedies": ["Set enforce = true to disable service account keys"]
    },
    {
      "condition": "Check if enforce is enabled for disabling SA keys",
      "attribute_path": ["spec", 0, "rules", 0, "enforce"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
