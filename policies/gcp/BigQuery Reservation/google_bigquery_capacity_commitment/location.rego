package terraform.gcp.security.bigquery_reservation.google_bigquery_capacity_commitment.location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_capacity_commitment.vars as vars


conditions := [
  [
    {
      "situation_description": "BigQuery capacity commitment location is not approved",
      "remedies": [
        "Set location to an approved location (e.g., US)."
      ]
    },
    {
      "condition": "location must be set to an approved location",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

result := data.terraform.helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
