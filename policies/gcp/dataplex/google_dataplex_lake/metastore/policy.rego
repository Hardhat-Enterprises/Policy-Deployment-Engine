package terraform.gcp.security.dataplex.google_dataplex_lake.metastore

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_lake.vars

# Condition: ensure metastore is defined
conditions := [
  [
    {
      "situation_description": "Dataplex Lakes should be linked to a metastore for cataloging",
      "remedies": ["Attach a valid metastore to the Dataplex Lake"]
    },
    {
      "condition": "Check if metastore is set",
      "attribute_path": ["metastore", 0, "service"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

# Summary and details
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
