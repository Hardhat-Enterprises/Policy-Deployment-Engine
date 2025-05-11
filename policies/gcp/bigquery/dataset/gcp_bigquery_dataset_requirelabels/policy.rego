package terraform.gcp.security.bigquery.dataset.require_labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery.dataset.vars

conditions := [
  [
    {"situation_description": "BigQuery dataset has no labels applied",
     "remedies": ["Add labels to the dataset for resource management and billing tracking"]},
    {
      "condition": "Check if labels attribute exists and is not empty",
      "attribute_path": ["labels"],
      "values": [".+"],  # At least one label key-value pair
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
