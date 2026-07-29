package terraform.gcp.security.compute_engine.google_compute_reservation.zone
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_reservation.vars

conditions := [
  [
    {
      "situation_description": "zone is not one of the approved data-residency zones, which risks storing reserved capacity and associated workload data outside the region required by policy",
      "remedies": [
        "Set zone to one of the approved zones: australia-southeast1-a, australia-southeast1-b, or australia-southeast1-c"
      ]
    },
    {
      "condition": "zone must be an approved australia-southeast1 zone",
      "attribute_path": ["zone"],
      "policy_type": "whitelist",
      "values": ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
