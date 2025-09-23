package terraform.gcp.security.dataplex.google_dataplex_lake.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_lake.vars

# Condition: ensure labels include ownership and environment
conditions := [
  [
    {
      "situation_description": "Dataplex Lakes must have labels for ownership and environment tracking",
      "remedies": ["Add labels such as 'owner' and 'environment'"]
    },
    {
      "condition": "Check if labels are present",
      "attribute_path": ["labels"],
      "values": [null], 
      "policy_type": "whitelist"
    }
  ]
]

# Summary messages
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
