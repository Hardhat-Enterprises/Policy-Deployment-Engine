package terraform.gcp.security.dataplex.google_dataplex_zone.discovery_spec

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

# Ensure discovery_spec is enabled
conditions := [
  [
    {
      "situation_description": "Dataplex Zones must enable discovery_spec to ensure metadata discovery and security visibility",
      "remedies": [
        "In your Terraform config, set discovery_spec.enabled = true",
        "Avoid disabling discovery_spec for Dataplex Zones"
      ]
    },
    {
      "condition": "Check if discovery_spec.enabled is true",
      "attribute_path": ["discovery_spec", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

# Compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
