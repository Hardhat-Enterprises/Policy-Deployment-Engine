package terraform.gcp.security.network_services.google_network_services_grpc_route.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_grpc_route.vars

conditions := [
    [
        {
            "situation_description": "The gRPC route can be destroyed through Terraform, which can remove an active traffic-routing control and affect the availability and integrity of service routing.",
            "remedies": [
                "Set deletion_policy to PREVENT so Terraform cannot destroy the gRPC route during routine apply or destroy operations.",
                "Require an explicit reviewed configuration change before removing the routing control."
            ]
        },
        {
            "condition": "deletion_policy must protect the routing control against destructive loss",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details