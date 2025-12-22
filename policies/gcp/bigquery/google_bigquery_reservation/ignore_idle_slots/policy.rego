package terraform.gcp.security.bigquery.google_bigquery_reservation.ignore_idle_slots

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation is allowed to use idle slots from other reservations",
      "remedies": [
        "Set ignore_idle_slots to true to prevent using idle slots from other reservations."
      ]
    },
    {
      "condition": "ignore_idle_slots must be true",
      "attribute_path": ["ignore_idle_slots"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, vars.variables).message
details := data.terraform.helpers.get_multi_summary(conditions, vars.variables).details
