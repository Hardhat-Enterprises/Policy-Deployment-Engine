package terraform.gcp.security.cloud_platform_service.google_service_account.display_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

# (display_name) – exact matches only
conditions := [
  [
    {"situation_description": "Risky terms in display_name.",
     "remedies": ["Remove admin/root/owner/superuser; use neutral function names."]},
    {"condition": "Risky display_name", 
    "attribute_path": ["display_name"],
     "values": ["admin","root","owner","superuser","administrator","administration","root-service"],
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

