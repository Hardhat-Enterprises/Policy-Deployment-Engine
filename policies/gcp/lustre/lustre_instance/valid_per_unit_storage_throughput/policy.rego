package terraform.gcp.security.lustre.lustre_instance.valid_per_unit_storage_throughput

import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars

conditions := [
  [
    {
      "situation_description": "The 'per_unit_storage_throughput' must allowed values: 125, 250, 500, 1000 (MB/s/TiB).",
      "remedies": [
        "Set 'per_unit_storage_throughput' to one of the valid values: 125, 250, 500, or 1000.",
        "These values represent valid throughput tiers for Lustre file systems in GCP."
      ]
    },
    {
      "condition": "Invalid 'per_unit_storage_throughput' value.",
      "attribute_path": ["per_unit_storage_throughput"],
      "values": ["125", "250", "500", "1000"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
