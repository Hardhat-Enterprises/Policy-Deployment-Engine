package terraform.gcp.security.blockchain.blockchain_nodes.blockchain_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is deployed on unsupported or insecure blockchain type",
      "remedies": [
        "Restrict nodes to approved blockchains, e.g., `ETHEREUM` only."
      ]
    },
    {
      "condition": "blockchain_type must be `ETHEREUM`",
      "attribute_path": ["blockchain_type"],
      "values": ["ETHEREUM"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
