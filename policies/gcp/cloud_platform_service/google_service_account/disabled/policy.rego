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
 

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details

