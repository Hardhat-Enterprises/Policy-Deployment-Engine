package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.allowed_encryption_statuses

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
  [
    {
      "situation_description": "A list of allowed encryptions statuses. An empty list allows all statuses. Each value may be one of: ENCRYPTION_UNSPECIFIED, ENCRYPTION_UNSUPPORTED, UNENCRYPTED, ENCRYPTED.",
      "remedies": ["Update allowed_encryption_statuses to include only allowed values as per organizational policy."]
    },
    {
      "condition": "os_type is not in blacklist",
      "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_encryption_statuses"],
      "values": ["ENCRYPTED"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details