package terraform.gcp.security.dataplex.google_dataplex_zone.type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

# Enforce valid Dataplex Zone types
conditions := [
  [
    {
      "situation_description": "Dataplex Zones must have type set to RAW or CURATED",
      "remedies": [
        "Change type to RAW for raw ingestion zones",
        "Change type to CURATED for processed and governed datasets"
      ]
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
