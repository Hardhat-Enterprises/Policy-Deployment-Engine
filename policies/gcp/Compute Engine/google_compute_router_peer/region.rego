package terraform.gcp.security.compute_engine.google_compute_router_peer.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_peer.vars

conditions := [
  [
    {
      "situation_description": "Cloud Router BGP Peer is created in a region outside the approved Australian regions.",
      "remedies": [
        "Set region to australia-southeast1 (Sydney)",
        "Set region to australia-southeast2 (Melbourne)"
      ]
    },
    {
      "condition": "Region must be an approved Australian region",
      "attribute_path": ["region"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
