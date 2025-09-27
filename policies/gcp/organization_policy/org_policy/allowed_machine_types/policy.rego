package terraform.gcp.security.organization_policy.org_policy.allowed_machine_types

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Organization must restrict machine types to approved list for cost and security reasons",
      "remedies": ["Restrict allowed machine types to only 'n1-standard-4' and 'e2-medium'"]
    },
    {
      "condition": "Check if only approved machine types are allowed",
      "attribute_path": ["spec", 0, "rules", 0, "values", 0, "allowed_values"],
      "values": ["n1-standard-4", "e2-medium"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
