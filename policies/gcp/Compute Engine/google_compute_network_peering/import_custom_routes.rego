package terraform.gcp.security.compute_engine.google_compute_network_peering.import_custom_routes
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars
conditions := [
    [
        {
            "situation_description": "Network peering imports custom routes from the peer, allowing the peer to influence local routing and creating a route-injection risk.",
            "remedies": ["Set import_custom_routes to false unless importing routes from this peer is explicitly required and the peer is trusted."]
        },
        {
            "condition": "import_custom_routes must be false.",
            "attribute_path": ["import_custom_routes"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details