package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.network

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.vars

conditions := [
  [
    {
      "situation_description": "Storage pool must attach to an approved VPC",
      "remedies": [
        "Set network to one of the approved VPC self-links below."
      ]
    },
    {
      "condition": "network equals an approved VPC",
      "attribute_path": ["network"],
      "values": [
        "projects/*/global/networks/*",
        [["deakin-lab-123"], ["nondefault-vpc", "prod-vpc"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
