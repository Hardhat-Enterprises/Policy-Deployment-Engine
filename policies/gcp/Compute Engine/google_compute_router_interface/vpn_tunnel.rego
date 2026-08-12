package terraform.gcp.security.compute_engine.google_compute_router_interface.vpn_tunnel

import data.terraform.gcp.security.compute_engine.google_compute_router_interface.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Router interface vpn_tunnel is not an approved VPN tunnel.",
      "remedies": [
        "Set vpn_tunnel to an approved VPN tunnel, e.g. approved-vpn-tunnel.",
      ],
    },
    {
      "condition": "vpn_tunnel must be one of the approved VPN tunnels.",
      "attribute_path": ["vpn_tunnel"],
      "values": [
        "approved-vpn-tunnel",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
