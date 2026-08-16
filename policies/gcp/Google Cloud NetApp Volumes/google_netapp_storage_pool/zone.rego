package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.zone

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.vars

conditions := [
  [
    {
      "situation_description": "The NetApp storage pool zone is outside the approved Australian regions.",
      "remedies": [
        "Configure 'zone' to use an approved Australian zone."
      ]
    },
    {
      "condition": "zone must be located in an approved Australian region.",
      "attribute_path": ["zone"],
      "values": [
        "australia-southeast1-a",
        "australia-southeast1-b",
        "australia-southeast1-c",
        "australia-southeast2-a",
        "australia-southeast2-b",
        "australia-southeast2-c"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details