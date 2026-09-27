package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.ldap_signing

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "LDAP traffic must be signed to protect directory communication from tampering.",
      "remedies": [
        "Set 'ldap_signing' to true."
      ]
    },
    {
      "condition": "ldap_signing must be enabled.",
      "attribute_path": ["ldap_signing"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details