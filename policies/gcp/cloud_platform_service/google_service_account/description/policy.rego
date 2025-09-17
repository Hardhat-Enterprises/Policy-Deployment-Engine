package terraform.gcp.security.cloud_platform_service.google_service_account.description

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

# Description must not be empty
conditions := [
  [
    {"situation_description": "Missing description (poor traceability).",
     "remedies": ["Add a clear purpose in `description` (owner, system, scope)."]},
    {
      "condition": "Empty description",
      "attribute_path": ["description"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

