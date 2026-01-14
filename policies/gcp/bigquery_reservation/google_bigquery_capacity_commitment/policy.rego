package terraform.gcp.security.bigquery_reservation.google_bigquery_capacity_commitment.location

import data.terraform.helpers

# Local variables (so you don't need a new vars.rego)
variables := {
  "friendly_resource_name": "BigQuery Capacity Commitment",
  "resource_type": "google_bigquery_capacity_commitment",
  "resource_value_name": "capacity_commitment_id"
}

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
      "values": ["US", "EU", "asia-northeast1"],
      "policy_type": "whitelist"
    }
  ]
]

message := data.terraform.helpers.get_multi_summary(conditions, variables).message
details := data.terraform.helpers.get_multi_summary(conditions, variables).details
