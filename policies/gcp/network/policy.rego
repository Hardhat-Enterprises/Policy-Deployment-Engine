package terraform.gcp.security.service_networking.network

import data.terraform.gcp.helpers
import data.terraform.gcp.security.service_networking.network.vars

allowed_networks := vars.variables["allowed_networks"]

conditions := [
  [
    {
      "situation_description": "The service networking connection must only attach to whitelisted VPC networks.",
      "remedies": [
        "Attach the service networking connection to an approved shared or production VPC network.",
        "Avoid using default, dev, or test networks for production resources."
      ],
    },
    {
      "condition": "network is a whitelisted value",
      "attribute_path": ["planned_values", "root_module", "resources", "*", "values", "network"],
      "values": allowed_networks,
      "policy_type": "whitelist"
    },
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
