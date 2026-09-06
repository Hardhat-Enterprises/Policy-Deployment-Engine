package terraform.gcp.security.google_network_services_lb_edge_extension.extension_chains.extensions.forward_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_edge_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Edge Extension should not forward credential-bearing HTTP headers.",
            "remedies": [
                "Remove credential-bearing headers from the forward_headers list.",
                "Review forwarded headers to ensure authentication credentials and session information are not exposed."
            ]
        },
        {
            "condition": "The forward_headers attribute must not contain credential-bearing HTTP headers.",
            "attribute_path": [
                "extension_chains",
                0,
                "extensions",
                0,
                "forward_headers"
            ],
            "values": [
                "Authorization",
                "Proxy-Authorization",
                "Cookie",
                "X-API-Key"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details