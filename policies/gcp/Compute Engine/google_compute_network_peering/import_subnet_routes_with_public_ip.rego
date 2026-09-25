package terraform.gcp.security.compute_engine.google_compute_network_peering.import_subnet_routes_with_public_ip
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars
conditions := [
    [
        {
            "situation_description": "Network peering imports subnet routes with public IP ranges from the peer, pulling externally-addressable ranges into local routing.",
            "remedies": ["Set import_subnet_routes_with_public_ip to false unless the peer's public-IP ranges should be routable locally."]
        },
        {
            "condition": "import_subnet_routes_with_public_ip must be false.",
            "attribute_path": ["import_subnet_routes_with_public_ip"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details