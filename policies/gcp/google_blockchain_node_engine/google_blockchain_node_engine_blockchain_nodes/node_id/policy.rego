package terraform.gcp.security.blockchain.blockchain_nodes.node_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node ID is missing or malformed",
      "remedies": [
        "Specify `blockchain_node_id` as an alphanumeric string, e.g., `node1234`"
      ]
    },
    {
      "condition": "`blockchain_node_id` must not be empty",
      "attribute_path": ["blockchain_node_id"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
