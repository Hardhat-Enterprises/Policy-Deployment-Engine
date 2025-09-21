package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.valid_dns

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {"situation_description": "DNS must point to approved internal resolvers",
     "remedies": [
       "Set dns to one of the approved pairs, e.g.:",
       "\"10.10.0.10\" (Melbourne)"
     ]},
    {
      "condition": "dns equals an approved resolver pair",
      "attribute_path": ["dns"],
      "values": [
        "10.10.0.10"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
