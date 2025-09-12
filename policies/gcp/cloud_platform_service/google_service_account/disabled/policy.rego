package terraform.gcp.security.cloud_platform_service.google_service_account.disabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

# Disabled on creation – boolean true (not string)
conditions := [
  [
    {"situation_description": "Service account is created in a disabled state.",
     "remedies": ["Create active identities; disable later with justification in `description`."]},
    {"condition": "Disabled on creation", 
    "attribute_path": "disabled", 
    "values": [true], 
    "policy_type": "blacklist"}
  ]
]
 
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

