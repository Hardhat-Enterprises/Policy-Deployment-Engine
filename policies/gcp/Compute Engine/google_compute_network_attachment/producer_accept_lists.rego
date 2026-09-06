package terraform.gcp.security.compute_engine.google_compute_network_attachment.producer_accept_lists

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment producer_accept_lists is empty, so no producer projects are explicitly approved.",
      "remedies": [
        "Set producer_accept_lists to the project(s) explicitly approved to connect to this network attachment.",
      ],
    },
    {
      "condition": "producer_accept_lists must not be empty or invalid.",
      "attribute_path": ["producer_accept_lists"],
      "values": [null, [], "invalid-project"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
