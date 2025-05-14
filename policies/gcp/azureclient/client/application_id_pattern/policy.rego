package terraform.gcp.security.azureclient.client.application_id_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.vars

conditions := [
  {
    "situation_description": "Azure client must use a valid application_id format",
    "remedies": ["Use format like app-123456789012"],
    "condition": "Invalid application_id pattern",
    "attribute_path": ["application_id"],
    "regex": "^app-[0-9]{12}$",
    "policy_type": "pattern blacklist"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail := summary.details
