package terraform.gcp.security.compute_engine.google_compute_network_peering.export_custom_routes
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars
conditions := [
    [
        {
            "situation_description": "Network peering exports custom routes to the peer, potentially exposing paths to sensitive internal or hybrid-connected ranges.",
            "remedies": ["Set export_custom_routes to false unless custom route sharing with this peer is explicitly required and approved."]
        },
        {
            "condition": "export_custom_routes must be false.",
            "attribute_path": ["export_custom_routes"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details