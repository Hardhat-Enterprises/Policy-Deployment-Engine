package terraform.gcp.security.organization_policy.org_policy.resource_locations

import data.terraform.gcp.helpers
import data.terraform.gcp.security.organization_policy.org_policy.vars

conditions := [
  [
    {
      "situation_description": "Resources must be created only in approved locations",
      "remedies": ["Restrict allowed locations to 'us-central1' and 'us-east1'"]
    },
    {
      "condition": "Check if resources are deployed only in approved regions",
      "attribute_path": ["spec", 0, "rules", 0, "values", 0, "allowed_values"],
      "values": ["us-central1", "us-east1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
