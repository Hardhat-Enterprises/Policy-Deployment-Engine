package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.valid_username

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "Block risky/built-in usernames",
      "remedies": ["Switch to a least-privilege service account (e.g., svc_netapp_joiner)."]
    },
    {
      "condition": "username must not be a built-in/admin account or empty",
      "attribute_path": ["username"],
      "values": ["", "administrator", "admin", "root", "guest"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
