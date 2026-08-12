package terraform.gcp.security.compute_engine.google_compute_router_interface.subnetwork

import data.terraform.gcp.security.compute_engine.google_compute_router_interface.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Router interface subnetwork is not an approved subnetwork.",
      "remedies": [
        "Set subnetwork to an approved subnetwork, e.g. projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork.",
      ],
    },
    {
      "condition": "subnetwork must be one of the approved subnetworks.",
      "attribute_path": ["subnetwork"],
      "values": [
        "projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
