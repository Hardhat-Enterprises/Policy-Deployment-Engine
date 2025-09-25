package terraform.gcp.security.blockchain.blockchain_nodes.geth_node_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Ethereum Geth node type is insecure or not production-ready.",
      "remedies": [
        "Restrict nodes to `FULL_NODE` type only."
      ]
    },
    {
      "condition": "geth_node_type must be FULL_NODE",
      "attribute_path": ["ethereum_details", "geth_details", "node_type"],
      "values": ["FULL_NODE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
