package terraform.gcp.security.blockchain.blockchain_nodes.node_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Node is deployed on an insecure or unsupported Ethereum network",
      "remedies": [
        "Set `ethereum_details.network` to `MAINNET` for production security"
      ]
    },
    {
      "condition": "`ethereum_details.network` must be MAINNET",
      "attribute_path": ["ethereum_details", 0, "network"],
      "values": ["MAINNET"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
