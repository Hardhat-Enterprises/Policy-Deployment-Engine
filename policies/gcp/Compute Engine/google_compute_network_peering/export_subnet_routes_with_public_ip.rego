package terraform.gcp.security.compute_engine.google_compute_network_peering.export_subnet_routes_with_public_ip
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars
conditions := [
    [
        {
            "situation_description": "Network peering exports subnet routes with public IP ranges to the peer, widening exposure of externally-addressable ranges.",
            "remedies": ["Set export_subnet_routes_with_public_ip to false unless public-IP subnet routes must be reachable via the peer."]
        },
        {
            "condition": "export_subnet_routes_with_public_ip must be false.",
            "attribute_path": ["export_subnet_routes_with_public_ip"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details