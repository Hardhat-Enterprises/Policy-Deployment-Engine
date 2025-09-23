package terraform.gcp.security.dataplex.google_dataplex_zone.location_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

# Ensure resource_spec.location_type is SINGLE_REGION or MULTI_REGION
conditions := [
  [
    {
      "situation_description": "Dataplex Zones must use a valid location_type (SINGLE_REGION or MULTI_REGION)",
      "remedies": ["Set resource_spec.location_type to SINGLE_REGION or MULTI_REGION"]
    },
    {
      "condition": "Check if location_type is valid",
      "attribute_path": ["resource_spec", 0, "location_type"],
      "values": ["SINGLE_REGION", "MULTI_REGION"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
