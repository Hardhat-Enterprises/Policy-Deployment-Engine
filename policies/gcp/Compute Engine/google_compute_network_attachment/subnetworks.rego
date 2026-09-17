package terraform.gcp.security.compute_engine.google_compute_network_attachment.subnetworks

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment subnetworks contains an invalid or placeholder subnetwork entry.",
      "remedies": [
        "Remove the invalid placeholder entry and use a valid subnetwork reference.",
      ],
    },
    {
      "condition": "subnetworks must not contain an invalid placeholder entry.",
      "attribute_path": ["subnetworks"],
      "values": ["invalid-subnetwork"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
