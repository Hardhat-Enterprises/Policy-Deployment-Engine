package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.encrypt_dc_connections

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "Domain controller connections must be encrypted.",
      "remedies": [
        "Set 'encrypt_dc_connections' to true."
      ]
    },
    {
      "condition": "encrypt_dc_connections must be enabled.",
      "attribute_path": ["encrypt_dc_connections"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details