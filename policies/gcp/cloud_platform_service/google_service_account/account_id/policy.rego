package terraform.gcp.security.cloud_platform_service.google_service_account.account_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

# (account_id) – single, simple blacklist
conditions := [
  [
    {"situation_description": "Risky terms in account_id.",
     "remedies": ["Remove admin/root/owner/superuser; name by function (e.g., etl-runner)."]},
    {
      "condition": "Risky account_id",
      "attribute_path": ["account_id"],
      "values": ["admin","root","owner","superuser","administrator","administration"],
      "policy_type": "blacklist"
    }
  ]
]
 
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

