package terraform.gcp.security.compute_engine.google_compute_network_peering.import_subnet_routes_with_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering imports subnet routes with public IP ranges from the peer network, which may introduce unwanted public routing paths.",
            "remedies": ["Set import_subnet_routes_with_public_ip to false to prevent importing public IP subnet routes from the peer VPC."]
        },
        {
            "condition": "import_subnet_routes_with_public_ip should be false to avoid importing public IP routes.",
            "attribute_path": ["import_subnet_routes_with_public_ip"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details