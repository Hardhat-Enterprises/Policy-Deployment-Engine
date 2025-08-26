package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.username

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {"situation_description": "Username must be a dedicated service account in the Deakin domain",
     "remedies": [
       "Use a UPN like \"svc_netapp_joiner@deakin.internal\" or SAM like \"DEAKIN\\svc_netapp_joiner\""
     ]},
    {
      "condition": "username matches allowed patterns (svc_ prefix; UPN or SAM with Deakin domain)",
      "attribute_path": ["username"],
      "values": [
        "^svc_[A-Za-z0-9._-]{3,30}@deakin\\.internal$",
        "^DEAKIN\\\\svc_[A-Za-z0-9._-]{3,30}$"
      ],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {"situation_description": "Block risky/built-in usernames",
     "remedies": ["Switch to a least-privilege service account such as \"svc_netapp_joiner\""]},
    {
      "condition": "username must not be a built-in/admin-style account",
      "attribute_path": ["username"],
      "values": ["(?i)^(administrator|admin|root|guest)$"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
