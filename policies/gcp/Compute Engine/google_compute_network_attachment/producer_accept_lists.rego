package terraform.gcp.security.compute_engine.google_compute_network_attachment.producer_accept_lists

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment producer_accept_lists contains a wildcard-like entry, exposing the attachment to any consumer project.",
      "remedies": [
        "Remove the wildcard entry and list only the specific, explicitly approved consumer project(s).",
      ],
    },
    {
      "condition": "producer_accept_lists must not contain a wildcard entry.",
      "attribute_path": ["producer_accept_lists"],
      "values": ["*"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
