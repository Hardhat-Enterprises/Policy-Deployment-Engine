package terraform.gcp.security.service_networking.network

import data.terraform.gcp.helpers
import data.terraform.gcp.security.service_networking.network.vars

banned_networks := vars.variables["banned_networks"]

conditions := [
  [
    {
      "situation_description": "The service networking connection is attached to a banned VPC network (default/dev/test).",
      "remedies": [
        "Attach the service networking connection to an approved shared VPC network.",
        "Avoid using the default, dev, or test networks for production resources."
      ],
    },
    {
      "condition": "network is NOT a banned value",
      "attribute_path": ["network"],
      "values": banned_networks,
      "policy_type": "blacklist"
    },
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
