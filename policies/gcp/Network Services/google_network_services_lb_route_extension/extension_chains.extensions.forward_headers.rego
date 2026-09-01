package terraform.gcp.security.network_services.google_network_services_lb_route_extension.forward_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_route_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Route Extension should forward only approved HTTP headers.",
            "remedies": [
                "Configure forward_headers to include only approved headers.",
                "Remove unnecessary or sensitive headers from the forward_headers list."
            ]
        },
        {
            "condition": "The forward_headers attribute must contain only approved headers.",
            "attribute_path": [
                "extension_chains",
                0,
                "extensions",
                0,
                "forward_headers"
            ],
            "values": [
                "X-Request-Id",
                "X-Correlation-Id"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details