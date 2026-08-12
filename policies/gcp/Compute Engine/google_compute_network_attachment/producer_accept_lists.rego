package terraform.gcp.security.compute_engine.google_compute_network_attachment.producer_accept_lists

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment producer_accept_lists includes unapproved projects.",
      "remedies": [
        "Restrict producer_accept_lists to only approved-project-123 or other explicitly approved project IDs.",
      ],
    },
    {
      "condition": "producer_accept_lists must contain only approved projects.",
      "attribute_path": ["producer_accept_lists"],
      "values": [
        "approved-project-123",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
