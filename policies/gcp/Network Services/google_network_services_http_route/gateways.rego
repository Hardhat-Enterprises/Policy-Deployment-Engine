package terraform.gcp.security.network_services.google_network_services_http_route.gateways

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's gateways list includes a wildcard entry ('*'). Attaching to an unapproved or overly permissive gateway can expose routing to unintended external traffic.",
            "remedies": [
                "Remove the wildcard '*' entry from gateways.",
                "List only the specific, approved Gateway resource references this route should attach to."
            ]
        },
        {
            "condition": "Check that no gateways entry is a wildcard",
            "attribute_path": ["gateways"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details