package terraform.gcp.security.compute_engine.google_compute_network_peering.import_custom_routes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering has import_custom_routes enabled, allowing the peer network to influence local routing decisions.",
            "remedies": ["Set import_custom_routes to false to prevent the peer VPC from injecting custom routes into the local network."]
        },
        {
            "condition": "import_custom_routes should be false to prevent peer-influenced routing.",
            "attribute_path": ["import_custom_routes"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details