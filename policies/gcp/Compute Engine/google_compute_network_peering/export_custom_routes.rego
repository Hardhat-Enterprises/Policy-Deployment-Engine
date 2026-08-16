package terraform.gcp.security.compute_engine.google_compute_network_peering.export_custom_routes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering has export_custom_routes enabled, which exposes internal custom routes to the peer network.",
            "remedies": ["Set export_custom_routes to false to prevent leaking internal routing information to the peer VPC."]
        },
        {
            "condition": "export_custom_routes should be false to avoid exposing internal routes.",
            "attribute_path": ["export_custom_routes"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details