
package terraform.gcp.security.google_network_services_lb_edge_extension.extension_chains.extensions.forward_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_edge_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Edge Extension should forward only explicitly approved HTTP headers.",
            "remedies": [
                "Configure forward_headers using only the approved safe header set.",
                "Remove unapproved or sensitive headers from the forward_headers list."
            ]
        },
        {
            "condition": "The forward_headers attribute must contain only explicitly approved safe headers.",
            "attribute_path": [
                "extension_chains",
                0,
                "extensions",
                0,
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