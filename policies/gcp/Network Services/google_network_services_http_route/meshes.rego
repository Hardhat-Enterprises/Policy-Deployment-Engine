package terraform.gcp.security.network_services.google_network_services_http_route.meshes

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's meshes list includes a wildcard entry ('*'). An unapproved or overly permissive mesh binding can expose internal service traffic incorrectly.",
            "remedies": [
                "Remove the wildcard '*' entry from meshes.",
                "List only the specific, approved service mesh resource references this route should attach to."
            ]
        },
        {
            "condition": "Check that no meshes entry is a wildcard",
            "attribute_path": ["meshes"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details