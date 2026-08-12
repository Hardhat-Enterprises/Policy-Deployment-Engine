package terraform.gcp.security.compute_engine.google_compute_network_attachment.subnetworks

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment subnetworks includes an unapproved subnetwork.",
      "remedies": [
        "Restrict subnetworks to only projects/approved-project/regions/australia-southeast1/subnetworks/approved-subnetwork or other explicitly approved subnetworks.",
      ],
    },
    {
      "condition": "subnetworks must contain only approved subnetworks.",
      "attribute_path": ["subnetworks"],
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
