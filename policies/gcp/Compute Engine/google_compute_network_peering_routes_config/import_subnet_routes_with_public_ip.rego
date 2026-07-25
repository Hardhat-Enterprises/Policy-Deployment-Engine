package terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.import_subnet_routes_with_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering_routes_config.vars

conditions := [
    [
    {"situation_description" : "import_subnet_routes_with_public_ip is enabled",
    "remedies":[ "Set import_subnet_routes_with_public_ip to false unless importing public-IP subnet routes from the peer network is explicitly required"]},
    {
        "condition": "Test if import_subnet_routes_with_public_ip is true",
        "attribute_path" : ["import_subnet_routes_with_public_ip"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
