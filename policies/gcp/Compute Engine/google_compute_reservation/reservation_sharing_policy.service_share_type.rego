package terraform.gcp.security.compute_engine.google_compute_reservation.reservation_sharing_policy_service_share_type
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_reservation.vars

conditions := [
  [
    {
      "situation_description": "service_share_type is set to ALLOW_ALL, which lets this reservation's capacity be automatically shared with other Google Cloud managed services outside the team's direct control",
      "remedies": [
        "Set reservation_sharing_policy_service_share_type to DISALLOW_ALL"
      ]
    },
    {
      "condition": "service_share_type must be DISALLOW_ALL",
      "attribute_path": ["reservation_sharing_policy", "service_share_type"],
      "policy_type": "whitelist",
      "values": ["DISALLOW_ALL"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
