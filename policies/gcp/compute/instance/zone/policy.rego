package terraform.gcp.security.compute.instance.zone

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.instance.vars

conditions := [
  [
    {
      "situation_description": "Instance is deployed outside the allowed Australian zones",
      "remedies": [
        "Use zones only within australia-southeast1: 'australia-southeast1-a', 'australia-southeast1-b', or 'australia-southeast1-c'"
      ]
    },
    {
      "condition": "zone must be one of the allowed Australian zones",
      "attribute_path": ["zone"],
      "values": [
        "australia-southeast1-a",
        "australia-southeast1-b",
        "australia-southeast1-c"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
