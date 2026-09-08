package terraform.gcp.security.network_services.google_network_services_grpc_route.location

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_grpc_route.vars

conditions := [
    [
        {
            "situation_description": "The gRPC route is not configured in the approved location.",
            "remedies": [
                "Configure the gRPC route in the approved location.",
                "Use global as the approved location for this resource."
            ]
        },
        {
            "condition": "location must use the approved location",
            "attribute_path": ["location"],
            "values": ["global"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details