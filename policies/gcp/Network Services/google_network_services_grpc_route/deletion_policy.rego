package terraform.gcp.security.network_services.google_network_services_grpc_route.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_grpc_route.vars

conditions := [
    [
        {
            "situation_description": "The gRPC route is not protected against unintended destructive removal.",
            "remedies": [
                "Set deletion_policy to PREVENT so destruction of the gRPC route is blocked by default.",
                "Require an explicit and reviewed configuration change before allowing destructive removal of the resource."
            ]
        },
        {
            "condition": "deletion_policy must provide protection against destructive loss",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details