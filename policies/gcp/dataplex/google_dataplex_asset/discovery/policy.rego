package terraform.gcp.security.dataplex.google_dataplex_asset.discovery

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

# Condition: ensure discovery_spec is enabled
conditions := [
  [
    {
      "situation_description": "Dataplex Asset must have discovery_spec enabled for metadata visibility and security",
      "remedies": ["Enable discovery_spec with enabled = true"]
    },
    {
      "condition": "Check if discovery_spec.enabled is true",
      "attribute_path": ["discovery_spec", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
