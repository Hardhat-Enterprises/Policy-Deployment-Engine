package terraform.gcp.security.blockchain.blockchain_nodes.allowed_mev_relays

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Unapproved MEV relay URLs are configured, which may route validator traffic through untrusted parties.",
      "remedies": [
        "Restrict relay URLs to approved list, e.g., `https://relay.flashbots.net/` only."
      ]
    },
    {
      "condition": "mev_relay_urls must only include approved endpoints",
      "attribute_path": ["ethereum_details", 0, "validator_config", 0, "mev_relay_urls"],
      "values": ["https://relay.flashbots.net/","https://trusted.mev.org/"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
