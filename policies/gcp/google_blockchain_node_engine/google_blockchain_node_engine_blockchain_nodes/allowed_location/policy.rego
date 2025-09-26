package terraform.gcp.security.blockchain.blockchain_nodes.allowed_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node is deployed in unsupported GCP locations",
      "remedies": [
        "Restrict deployment to approved locations, e.g., `us-central1` only."
      ]
    },
    {
      "condition": "location must be `us-central1`",
      "attribute_path": ["location"],
      "values": ["us-central1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
