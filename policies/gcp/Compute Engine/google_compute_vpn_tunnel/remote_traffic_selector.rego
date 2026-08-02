package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.remote_traffic_selector

import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "The VPN tunnel permits routing to any remote destination (0.0.0.0/0) rather than a defined set of peer CIDR ranges.",
                "remedies": ["Update remote_traffic_selector to list only the specific remote CIDR ranges reachable through the tunnel."],
        },
        {
                "condition": "remote_traffic_selector does not contain 0.0.0.0/0",
                "attribute_path": ["remote_traffic_selector"],
                "values": ["0.0.0.0/0"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
