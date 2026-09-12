package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "The NetApp Active Directory resource must be protected from accidental deletion.",
      "remedies": [
        "Set 'deletion_policy' to 'PREVENT'."
      ]
    },
    {
      "condition": "deletion_policy must be PREVENT.",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details