package terraform.gcp.security.dataplex.google_dataplex_zone.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

# Conditions for labels
conditions := [
  [
    {
      "situation_description": "Dataplex Zones must have an 'owner' label for accountability",
      "remedies": ["Add a label key 'owner' with an appropriate team or contact"]
    },
    {
      "condition": "Check if 'owner' label is present",
      "attribute_path": ["labels", "owner"],
      "values": ["security-team"], 
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Dataplex Zones must have an 'environment' label (e.g., dev, test, prod)",
      "remedies": ["Add a label key 'environment' with values like dev/test/prod"]
    },
    {
      "condition": "Check if 'environment' label is present",
      "attribute_path": ["labels", "environment"],
      "values": ["dev", "test", "prod"], 
      "policy_type": "whitelist"
    }
  ]
]

# General summary
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
