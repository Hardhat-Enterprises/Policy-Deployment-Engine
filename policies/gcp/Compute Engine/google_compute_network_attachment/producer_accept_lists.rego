package terraform.gcp.security.compute_engine.google_compute_network_attachment.producer_accept_lists

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment producer_accept_lists contains an invalid or placeholder project entry.",
      "remedies": [
        "Remove the invalid placeholder entry and use a valid, explicitly approved project reference.",
      ],
    },
    {
      "condition": "producer_accept_lists must not contain an invalid placeholder entry.",
      "attribute_path": ["producer_accept_lists"],
      "values": ["invalid-project"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
