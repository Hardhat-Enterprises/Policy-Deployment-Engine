package terraform.gcp.security.compute_engine.google_compute_router_peer.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_peer.vars

conditions := [[
  {
    "situation_description": "Cloud Router BGP Peer can be destroyed by Terraform, risking accidental loss of dynamic routing over VPN or Interconnect.",
    "remedies": [
      "Set deletion_policy to PREVENT so the peer cannot be hard-destroyed without an explicit change.",
    ],
  },
  {
    "condition": "deletion_policy must be PREVENT or ABANDON.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT", "ABANDON"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
