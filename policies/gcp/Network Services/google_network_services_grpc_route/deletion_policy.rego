package terraform.gcp.security.network_services.google_network_services_grpc_route.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_grpc_route.vars

conditions := [
    [
        {
            "situation_description": "The Network Services GRPC Route is not protected against destructive Terraform deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Require an explicit reviewed lifecycle change before deleting the resource."
            ]
        },
        {
            "condition": "deletion_policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
