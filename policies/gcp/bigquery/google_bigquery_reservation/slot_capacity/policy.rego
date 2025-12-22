package terraform.gcp.security.bigquery.google_bigquery_reservation.slot_capacity

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation has an invalid baseline slot capacity",
      "remedies": [
        "Set slot_capacity to a value greater than 0 (for example, 100)."
      ]
    },
    {
      "condition": "slot_capacity must be greater than 0",
      "attribute_path": ["slot_capacity"],
      "values": [1, null],
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
