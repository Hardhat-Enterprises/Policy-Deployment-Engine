package terraform.gcp.security.dataplex.google_dataplex_zone.type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

# Ensure zone type is either RAW or CURATED
conditions := [
  [
    {
      "situation_description": "Dataplex Zones must have type set to RAW or CURATED",
      "remedies": ["Set the zone type to RAW or CURATED"]
    },
    {
      "condition": "Check if type is RAW or CURATED",
      "attribute_path": ["type"],
      "values": ["RAW", "CURATED"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
