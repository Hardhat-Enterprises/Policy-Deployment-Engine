package terraform.gcp.security.blockchain.blockchain_nodes.restrict_environment

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is deployed in an insecure environment label (e.g., `dev`).",
      "remedies": [
        "Restrict deployments to `prod` environment only."
      ]
    },
    {
      "condition": "labels.environment must not be `dev`",
      "attribute_path": ["labels", "environment"],
      "values": ["prod"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
