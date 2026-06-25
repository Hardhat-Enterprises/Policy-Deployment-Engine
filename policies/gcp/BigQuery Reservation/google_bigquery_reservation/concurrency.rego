package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.concurrency

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation concurrency exceeds the approved limit",
      "remedies": [
        "Reduce concurrency to an approved maximum (for example, 100 or less)."
      ]
    },
    {
      "condition": "concurrency must be within the approved range",
      "attribute_path": ["concurrency"],
      "values": [0, 100],
      "policy_type": "range"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, vars.variables).message
details := data.terraform.helpers.get_multi_summary(conditions, vars.variables).details
