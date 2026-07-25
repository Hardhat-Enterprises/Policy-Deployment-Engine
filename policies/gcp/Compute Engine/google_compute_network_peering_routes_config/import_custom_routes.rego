package terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.import_custom_routes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.vars

conditions := [
    [
    {"situation_description" : "import_custom_routes is enabled",
    "remedies":[ "Set import_custom_routes to false unless importing custom routes from the peer network is explicitly required"]},
    {
        "condition": "Test if import_custom_routes is true",
        "attribute_path" : ["import_custom_routes"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
