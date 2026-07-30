package terraform.gcp.security.google_network_services_lb_traffic_extension.forward_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_traffic_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Traffic Extension should forward only approved HTTP headers.",
            "remedies": [
                "Configure forward_headers to include only approved headers.",
                "Remove sensitive or unnecessary headers from the forward_headers list."
            ]
        },
        {
            "condition": "The forward_headers attribute must contain only approved headers.",
            "attribute_path": [
                "extension_chains",
                "extensions",
                "forward_headers"
            ],
            "values": [
                "X-Request-ID"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details