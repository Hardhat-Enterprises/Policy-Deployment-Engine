package terraform.gcp.security.network_services.google_network_services_lb_route_extension.extension_chains_extensions_forward_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_route_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Route Extension does not explicitly configure forward_headers.",
            "remedies": [
                "Configure forward_headers with at least one header required by the application or extension.",
                "Do not leave forward_headers unset or empty."
            ]
        },
        {
            "condition": "forward_headers must be explicitly configured and non-empty",
            "attribute_path": [
                "extension_chains",
                0,
                "extensions",
                0,
                "forward_headers"
            ],
            "values": [
                null,
                []
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details