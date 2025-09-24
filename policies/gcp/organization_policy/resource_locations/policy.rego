package terraform.gcp.security.organization_policy.resource_locations

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.vars

conditions := [
  [
    {
      "situation_description": "Resources must be deployed only in approved locations",
      "remedies": ["Restrict locations using allowed_values"]
    },
    {
      "condition": "Check if location is in approved list",
      "attribute_path": ["spec", 0, "rules", 0, "values", 0, "allowed_values"],
      "values": ["us-central1", "us-east1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
