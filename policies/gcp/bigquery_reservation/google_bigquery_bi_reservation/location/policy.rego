package terraform.gcp.security.bigquery_reservation.google_bigquery_bi_reservation.location

import data.terraform.helpers

variables := {
  "friendly_resource_name": "BigQuery BI Reservation",
  "resource_type": "google_bigquery_bi_reservation",
  "resource_value_name": "name"
}

conditions := [
  [
    {
      "situation_description": "BigQuery BI reservation location is not approved",
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

message := data.terraform.helpers.get_multi_summary(conditions, variables).message
details := data.terraform.helpers.get_multi_summary(conditions, variables).details
