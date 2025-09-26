package terraform.gcp.security.blockchain.blockchain_nodes.allowed_execution_client

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is using an unsupported or risky execution client.",
      "remedies": [
        "Restrict usage to trusted execution clients such as `ERIGON` or `GETH`."
      ]
    },
    {
      "condition": "execution_client must be one of the approved clients",
      "attribute_path": ["ethereum_details", 0, "execution_client"],
      "values": ["ERIGON", "GETH"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
