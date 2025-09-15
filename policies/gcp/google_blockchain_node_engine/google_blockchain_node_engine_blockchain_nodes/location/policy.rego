package terraform.gcp.security.blockchain.blockchain_nodes.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node deployed in unapproved location",
      "remedies": [
        "Deploy nodes only in approved regions: us-central1, europe-west1."
      ]
    },
    {
      "condition": "`location` must be an approved region",
      "attribute_path": ["location"],
      "values": ["us-central1", "europe-west1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
