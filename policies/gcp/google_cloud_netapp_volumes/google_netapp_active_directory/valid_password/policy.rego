package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.valid_password

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {"situation_description": "Password must not be empty or trivially weak",
     "remedies": ["Use a strong secret via a sensitive variable (e.g., var.ad_password)."]},
    {
      "condition": "password must not be empty or common weak values",
      "attribute_path": ["password"],
      "values": [
        "", "pass", "password", "Password1", "admin", "123456", "qwerty", "letmein"
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
