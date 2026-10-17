package terraform.gcp.security.network_services.google_network_services_grpc_route.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_grpc_route.vars

conditions := [
    [
        {
            "situation_description": "The gRPC route is not configured in a platform-approved location.",
            "remedies": [
                "Configure the gRPC route in a location permitted by the organisation's data residency policy.",
                "Use a platform-approved location that is supported by this resource."
            ]
        },
        {
            "condition": "location must be within the platform-approved location set",
            "attribute_path": ["location"],
            "values": ["global"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details