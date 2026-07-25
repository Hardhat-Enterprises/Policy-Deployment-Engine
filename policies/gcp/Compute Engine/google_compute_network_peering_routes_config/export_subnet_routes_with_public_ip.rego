package terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.export_subnet_routes_with_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.vars

conditions := [
    [
    {"situation_description" : "export_subnet_routes_with_public_ip is enabled",
    "remedies":[ "Set export_subnet_routes_with_public_ip to false unless exporting public-IP subnet routes to the peer network is explicitly required"]},
    {
        "condition": "Test if export_subnet_routes_with_public_ip is true",
        "attribute_path" : ["export_subnet_routes_with_public_ip"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
