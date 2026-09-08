package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.security_operators

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "Security Operator assignments must not use overly broad or wildcard principals.",
      "remedies": [
        "Remove wildcard, generic, or overly broad Security Operator principals and use explicitly authorised users or groups."
      ]
    },
    {
      "condition": "security_operators must not contain broad or wildcard principals.",
      "attribute_path": ["security_operators"],
      "values": ["*", "everyone", "all", "domain users"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details