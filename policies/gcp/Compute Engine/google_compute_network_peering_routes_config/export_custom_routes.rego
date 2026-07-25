package terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.export_custom_routes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.vars

conditions := [
    [
    {"situation_description" : "export_custom_routes is enabled",
    "remedies":[ "Set export_custom_routes to false unless exporting custom routes to the peer network is explicitly required"]},
    {
        "condition": "Test if export_custom_routes is true",
        "attribute_path" : ["export_custom_routes"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
