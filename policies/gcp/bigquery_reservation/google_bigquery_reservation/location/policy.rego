package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation location is not approved",
      "remedies": [
        "Set location to an approved region (e.g., us-central1)."
      ]
    },
    {
      "condition": "location must be set to an approved region",
      "attribute_path": ["location"],
      "values": ["us-central1"],
      "policy_type": "whitelist"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, vars.variables).message
details := data.terraform.helpers.get_multi_summary(conditions, vars.variables).details
