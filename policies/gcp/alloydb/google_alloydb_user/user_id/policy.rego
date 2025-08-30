package terraform.gcp.security.alloydb.google_alloydb_user.user_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars



conditions := [
  
  [
    {
      "situation_description": "User ID is a risky/default username",
      "remedies": [
        "Use a unique service-style ID (e.g., svc_app_env)",
        "Avoid admin/root/postgres/test/temp/dev/etc."
      ]
    },
    {
      "condition": "Disallow common/weak usernames",
      "attribute_path": ["user_id"],
      "values": ["MohamedA"],
      "policy_type": "blacklist"
    }
  ]

 
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
