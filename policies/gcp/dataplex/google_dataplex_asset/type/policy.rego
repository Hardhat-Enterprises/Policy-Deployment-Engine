package terraform.gcp.security.dataplex.google_dataplex_asset.type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

# Condition: enforce allowed resource_spec.type values
conditions := [
  [
    {
      "situation_description": "Dataplex Asset must use an approved type (STORAGE_BUCKET or BIGQUERY_DATASET)",
      "remedies": ["Change resource_spec.type to either STORAGE_BUCKET or BIGQUERY_DATASET"]
    },
    {
      "condition": "Check if resource_spec.type is approved",
      "attribute_path": ["resource_spec", 0, "type"],
      "values": ["STORAGE_BUCKET", "BIGQUERY_DATASET"],
      "policy_type": "whitelist"
    }
  ]
]

# General summary
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
