package terraform.gcp.security.blockchain.blockchain_nodes.allowed_consensus_client

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is using an unsupported or untested consensus client.",
      "remedies": [
        "Use only approved consensus client `LIGHTHOUSE`"
      ]
    },
    {
      "condition": "consensus_client must be one of the approved clients",
      "attribute_path": ["ethereum_details", 0, "consensus_client"],
      "values": ["LIGHTHOUSE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
