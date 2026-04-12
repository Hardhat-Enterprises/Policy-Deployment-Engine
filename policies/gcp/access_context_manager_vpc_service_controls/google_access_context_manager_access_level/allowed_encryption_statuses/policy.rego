package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.allowed_encryption_statuses

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
  [
    {
      "situation_description": "Ensure that only secure encryption states are permitted, preventing unencrypted or unsupported communication.",
      "remedies": ["Restrict allowed_encryption_statuses to only secure values such as ENCRYPTED."]
    },
    {
      "condition": "encryption status must be secure",
      "attribute_path": ["basic", 0, "conditions", 0, "device_policy", 0, "allowed_encryption_statuses"],
      "values": ["ENCRYPTED"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details