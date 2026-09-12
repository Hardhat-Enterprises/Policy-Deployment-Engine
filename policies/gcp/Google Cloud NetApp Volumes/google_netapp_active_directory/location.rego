package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.location

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {
      "situation_description": "The NetApp Active Directory resource must be deployed in an approved Australian region.",
      "remedies": [
        "Set 'location' to an approved Australian region."
      ]
    },
    {
      "condition": "location must be within an approved Australian region.",
      "attribute_path": ["location"],
      "values": [
        "australia-southeast1",
        "australia-southeast2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details