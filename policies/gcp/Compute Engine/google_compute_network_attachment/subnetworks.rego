package terraform.gcp.security.compute_engine.google_compute_network_attachment.subnetworks

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment subnetworks is empty or invalid, so no subnetwork is explicitly configured.",
      "remedies": [
        "Set subnetworks to the subnetwork(s) this network attachment should use.",
      ],
    },
    {
      "condition": "subnetworks must not be empty or invalid.",
      "attribute_path": ["subnetworks"],
      "values": [null, [], "invalid-subnetwork"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
