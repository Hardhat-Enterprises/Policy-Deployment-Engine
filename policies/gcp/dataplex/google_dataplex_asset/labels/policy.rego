package terraform.gcp.security.dataplex.google_dataplex_asset.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

conditions := [
  [
    {
      "situation_description": "Dataplex Asset must have labels for ownership and environment tracking",
      "remedies": ["Add labels 'owner' and 'environment' to the asset"]
    },
    {
      "condition": "Check if labels are present",
      "attribute_path": ["labels"],
      "values": [null], 
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
