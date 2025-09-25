package terraform.gcp.security.blockchain.blockchain_nodes.disk_size

import data.terraform.gcp.helpers
import data.terraform.gcp.security.blockchain.blockchain_nodes.vars

conditions := [
  [
    {
      "situation_description": "Blockchain node disk size is too small and may cause crashes/data loss.",
      "remedies": [
        "Set `disk_size_gb` to at least 500 GB for mainnet Ethereum nodes."
      ]
    },
    {
      "condition": "disk_size_gb must be >= 500",
      "attribute_path": ["disk_size_gb"],
      "values": [500],
      "policy_type": "min"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
