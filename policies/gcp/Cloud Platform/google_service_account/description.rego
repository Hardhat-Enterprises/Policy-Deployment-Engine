package terraform.gcp.security.cloud_platform_service.google_service_account.description

import data.terraform.helpers
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

