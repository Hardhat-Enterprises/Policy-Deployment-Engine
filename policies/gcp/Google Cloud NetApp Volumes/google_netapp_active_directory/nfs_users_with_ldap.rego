package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.nfs_users_with_ldap

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "LDAP identity checks must remain enforced for NFS users to prevent users without valid Active Directory identity information from gaining access.",
      "remedies": [
        "Set 'nfs_users_with_ldap' to true."
      ]
    },
    {
      "condition": "nfs_users_with_ldap must be enabled.",
      "attribute_path": ["nfs_users_with_ldap"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details