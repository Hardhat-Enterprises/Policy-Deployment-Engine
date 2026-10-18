package terraform.gcp.security.network_services.google_network_services_gateway.envoy_headers

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_gateway.vars

conditions := [
    [
        {
            "situation_description": "Envoy debug headers should remain disabled to avoid exposing internal implementation details.",
            "remedies": [
                "Set envoy_headers to NONE."
            ]
        },
        {
            "condition": "The envoy_headers attribute must be NONE.",
            "attribute_path": ["envoy_headers"],
            "values": ["NONE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details