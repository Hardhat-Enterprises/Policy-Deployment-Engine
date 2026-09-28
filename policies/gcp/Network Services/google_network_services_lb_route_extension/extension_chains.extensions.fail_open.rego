package terraform.gcp.security.network_services.google_network_services_lb_route_extension.extension_chains_extensions_fail_open

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_lb_route_extension.vars

conditions := [
    [
        {
            "situation_description": "The LB Route Extension should fail closed when an extension becomes unavailable.",
            "remedies": [
                "Set fail_open to false.",
                "Configure the extension to reject requests when the extension service fails."
            ]
        },
        {
            "condition": "The fail_open attribute must be set to false.",
            "attribute_path": [
                "extension_chains",
                0,
                "extensions",
                0,
                "fail_open"
            ],
            "values": [
                false
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details