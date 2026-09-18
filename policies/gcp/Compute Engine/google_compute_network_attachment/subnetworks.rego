package terraform.gcp.security.compute_engine.google_compute_network_attachment.subnetworks

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment subnetworks references the auto-created 'default' subnetwork, which is typically broader-access and shared across unrelated resources.",
      "remedies": [
        "Reference a purpose-built subnetwork for this attachment instead of the auto-created 'default' subnetwork.",
      ],
    },
    {
      "condition": "subnetworks must not reference the 'default' subnetwork.",
      "attribute_path": ["subnetworks"],
      "values": ["/subnetworks/default"],
      "policy_type": "element blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
