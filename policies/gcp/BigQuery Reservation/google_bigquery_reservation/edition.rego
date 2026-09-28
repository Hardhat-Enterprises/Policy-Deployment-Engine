package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.edition

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation edition is not approved",
      "remedies": [
        "Set edition to an approved value (e.g., ENTERPRISE)."
      ]
    },
    {
      "condition": "edition must be set to an approved value",
      "attribute_path": ["edition"],
      "values": ["ENTERPRISE"],
      "policy_type": "whitelist"
    }
  ]
]

result := data.terraform.helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
