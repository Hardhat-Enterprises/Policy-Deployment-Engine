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
 
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

