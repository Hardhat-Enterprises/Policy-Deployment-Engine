package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation_assignment.location

import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "BigQuery reservation assignment is linked to a reservation in an unapproved location",
      "remedies": [
        "Use a reservation located in an approved region (for example, us-central1)."
      ]
    },
    {
      "condition": "reservation location must be an approved value",
      "attribute_path": ["location"],
      "values": ["us-central1"],
      "policy_type": "whitelist"
    }
  ]
]

local_vars := {
  "friendly_resource_name": "BigQuery Reservation",
  "resource_type": "google_bigquery_reservation",
  "resource_value_name": "name"
}

message := data.terraform.helpers.get_multi_summary(conditions, local_vars).message
details := data.terraform.helpers.get_multi_summary(conditions, local_vars).details
