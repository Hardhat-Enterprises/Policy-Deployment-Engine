package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.local_traffic_selector

import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "The VPN tunnel exposes the entire local network (0.0.0.0/0) to the peer instead of a specific set of CIDR ranges.",
                "remedies": ["Update local_traffic_selector to list only the specific local CIDR ranges that must traverse the tunnel."],
        },
        {
                "condition": "local_traffic_selector does not contain 0.0.0.0/0",
                "attribute_path": ["local_traffic_selector"],
                "values": ["0.0.0.0/0"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
