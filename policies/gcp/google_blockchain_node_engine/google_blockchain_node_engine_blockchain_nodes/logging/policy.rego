package terraform.gcp.security.blockchain.blockchain_nodes.logging

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node logging is disabled.",
      "remedies": [
        "Set `logging_enabled` to true to allow monitoring and auditing."
      ]
    },
    {
      "condition": "logging_enabled must be true",
      "attribute_path": ["logging_enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
