package terraform.gcp.security.blockchain.blockchain_nodes.disable_debug_api

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Debug API is enabled on the blockchain node, which can leak sensitive internal state.",
      "remedies": [
        "Disable the Debug API by setting `api_enable_debug = false`."
      ]
    },
    {
      "condition": "api_enable_debug must be `false`",
      "attribute_path": ["ethereum_details", 0, "api_enable_debug"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
