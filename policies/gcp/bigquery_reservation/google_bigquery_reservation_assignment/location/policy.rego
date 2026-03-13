package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation_assignment.location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation_assignment.vars as vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation assignment is linked to a reservation in an unapproved location",
      "remedies": [
        "Use a reservation located in an approved region (for example, australia-southeast1)."
      ]
    },
    {
      "condition": "location must be an approved value",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, vars.variables).message
details := data.terraform.helpers.get_multi_summary(conditions, vars.variables).details
