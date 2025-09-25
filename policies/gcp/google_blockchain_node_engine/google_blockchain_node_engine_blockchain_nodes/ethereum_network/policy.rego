package terraform.gcp.security.blockchain.blockchain_nodes.ethereum_network

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is deployed on insecure Ethereum network (testnet/devnet).",
      "remedies": [
        "Restrict Ethereum nodes to `MAINNET` only."
      ]
    },
    {
      "condition": "ethereum_network must be MAINNET",
      "attribute_path": ["ethereum_details", "network"],
      "values": ["MAINNET"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
