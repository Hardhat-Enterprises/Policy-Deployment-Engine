package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.aes_encryption

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "AES encryption must be enabled for Kerberos communication with Active Directory.",
      "remedies": [
        "Set 'aes_encryption' to true."
      ]
    },
    {
      "condition": "aes_encryption must be enabled.",
      "attribute_path": ["aes_encryption"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details