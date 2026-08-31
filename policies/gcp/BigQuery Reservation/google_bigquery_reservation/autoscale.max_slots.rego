package terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.autoscale_max_slots


import data.terraform.helpers
import data.terraform.gcp.security.bigquery_reservation.google_bigquery_reservation.vars

conditions := [
  [
    {
      "situation_description": "BigQuery reservation autoscale max_slots exceeds the approved limit",
      "remedies": [
        "Reduce autoscale.max_slots to an approved maximum (for example, 1000 or less)."
      ]
    },
    {
      "condition": "autoscale.max_slots must be within the approved range",
      "attribute_path": ["autoscale", 0, "max_slots"],
      "values": [0, 1000],
      "policy_type": "range"
    }
  ]
]

result := data.terraform.helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
