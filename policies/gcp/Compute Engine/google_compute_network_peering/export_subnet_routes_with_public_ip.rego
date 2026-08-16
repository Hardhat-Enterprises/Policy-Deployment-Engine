package terraform.gcp.security.compute_engine.google_compute_network_peering.export_subnet_routes_with_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering exports subnet routes with public IP ranges, exposing public-facing infrastructure topology to the peer network.",
            "remedies": ["Set export_subnet_routes_with_public_ip to false to prevent exposing public IP subnet routes to the peer VPC."]
        },
        {
            "condition": "export_subnet_routes_with_public_ip should be false to avoid exposing public IP topology.",
            "attribute_path": ["export_subnet_routes_with_public_ip"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details