package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.administrators

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "Administrator assignments must not use overly broad or wildcard principals.",
      "remedies": [
        "Remove wildcard, generic, or overly broad administrator principals and use explicitly authorised users or groups."
      ]
    },
    {
      "condition": "administrators must not contain broad or wildcard principals.",
      "attribute_path": ["administrators"],
      "values": ["*", "everyone", "all", "domain users"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details