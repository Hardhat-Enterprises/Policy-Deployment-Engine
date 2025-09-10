package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.allowed_network

import data.terraform.gcp.helpers
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
        "projects/deakin-lab-123/global/networks/nondefault-vpc",
        "projects/deakin-lab-123/global/networks/prod-vpc"
      ],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Block default or empty network",
      "remedies": ["Use an approved non-default VPC."]
    },
    {
      "condition": "network must not be default or empty",
      "attribute_path": ["network"],
      "values": [
        "",
        "projects/deakin-lab-123/global/networks/default"
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
