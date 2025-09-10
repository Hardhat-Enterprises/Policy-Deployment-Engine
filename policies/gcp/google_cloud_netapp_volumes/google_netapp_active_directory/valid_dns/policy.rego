package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.valid_dns

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars

conditions := [
  [
    {"situation_description": "DNS must point to approved internal resolvers",
     "remedies": [
       "Set dns to one of the approved pairs, e.g.:",
       "\"10.10.0.10,10.10.0.11\" (Melbourne)",
       "\"10.20.0.10,10.20.0.11\" (Sydney)"
     ]},
    {
      "condition": "dns equals an approved resolver pair",
      "attribute_path": ["dns"],
      "values": [
        "10.10.0.10,10.10.0.11",
        "10.20.0.10,10.20.0.11"
      ],
      "policy_type": "whitelist"
    }
  ],
  [
    {"situation_description": "DNS cannot be empty",
     "remedies": ["Provide one of the approved resolver pairs"]},
    {
      "condition": "dns must not be empty",
      "attribute_path": ["dns"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
