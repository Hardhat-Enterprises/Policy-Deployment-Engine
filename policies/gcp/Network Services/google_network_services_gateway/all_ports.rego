package terraform.gcp.security.network_services.google_network_services_gateway

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_gateway.vars

conditions := [
    [
        {
            "situation_description": "The gateway must not listen on all ports.",
            "remedies": [
                "Set all_ports to false.",
                "Configure the gateway to listen only on the required application ports."
            ]
        },
        {
            "condition": "The all_ports attribute must be disabled.",
            "attribute_path": ["all_ports"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details