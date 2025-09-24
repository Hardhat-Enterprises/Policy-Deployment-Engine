package terraform.gcp.security.organization_policy.allowed_machine_types

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.allowed_machine_types.vars

# Policy: only allow approved machine types
conditions := [
  [
    {
      "situation_description": "Only approved machine types should be allowed by organization policy",
      "remedies": ["Restrict allowed_values to approved list, e.g., n1-standard-4, e2-medium"]
    },
    {
      "condition": "Check if allowed_values are restricted to approved types",
      "attribute_path": ["spec", 0, "rules", 0, "values", 0, "allowed_values"],
      "values": ["n1-standard-4", "e2-medium"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
