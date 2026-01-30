package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation_assignment.job_type

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation_assignment.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation assignment uses a non-approved job type",
      "remedies": [
        "Set job_type to an approved value (for example, QUERY or PIPELINE)."
      ]
    },
    {
      "condition": "job_type must be an approved value",
      "attribute_path": ["job_type"],
      "values": ["QUERY", "PIPELINE"],
      "policy_type": "whitelist"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, vars.variables).message
details := data.terraform.helpers.get_multi_summary(conditions, vars.variables).details
