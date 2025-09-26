package terraform.gcp.security.blockchain.blockchain_nodes.disable_admin_api

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Admin API is enabled on the blockchain node, which may expose sensitive administrative functions.",
      "remedies": [
        "Disable the Admin API by setting `api_enable_admin = false`."
      ]
    },
    {
      "condition": "api_enable_admin must be `false`",
      "attribute_path": ["ethereum_details", 0, "api_enable_admin"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
