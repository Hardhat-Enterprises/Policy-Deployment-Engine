package terraform.gcp.security.compute_engine.google_compute_network_attachment.subnetworks

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment subnetworks contains a wildcard-like entry, allowing unscoped subnets to receive producer traffic.",
      "remedies": [
        "Remove the wildcard entry and list only the specific, explicit subnetwork(s).",
      ],
    },
    {
      "condition": "subnetworks must not contain a wildcard entry.",
      "attribute_path": ["subnetworks"],
      "values": ["*"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
