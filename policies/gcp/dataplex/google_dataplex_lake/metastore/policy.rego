package terraform.gcp.security.dataplex.google_dataplex_lake.metastore

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_lake.vars

# Ensure metastore is defined
conditions := [
  [
    {
      "situation_description": "Dataplex Lake must have a metastore configuration for metadata management",
      "remedies": ["Add a metastore block with service set to Dataproc Metastore"]
    },
    {
      "condition": "Check if metastore.service is defined",
      "attribute_path": ["metastore", 0, "service"],
      "values": ["dataproc_metastore"], # or whatever valid value(s) your org allows
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
