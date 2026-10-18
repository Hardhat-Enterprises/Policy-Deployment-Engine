package terraform.gcp.security.compute_engine.google_compute_network_attachment.connection_preference

import data.terraform.gcp.security.compute_engine.google_compute_network_attachment.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Network attachment connection_preference allows automatic acceptance of consumer connections.",
      "remedies": [
        "Set connection_preference to ACCEPT_MANUAL so consumer connections require explicit approval.",
      ],
    },
    {
      "condition": "connection_preference must be ACCEPT_MANUAL.",
      "attribute_path": ["connection_preference"],
      "values": [
        "ACCEPT_MANUAL",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
