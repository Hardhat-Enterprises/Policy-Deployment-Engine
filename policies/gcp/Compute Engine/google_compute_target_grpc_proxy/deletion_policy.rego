package terraform.gcp.security.compute_engine.google_compute_target_grpc_proxy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_grpc_proxy.vars

conditions := [
    [
        {
            "situation_description": "Target gRPC Proxy may be abandoned and left outside Terraform management",
            "remedies": [
                "Do not set deletion_policy to ABANDON"
            ]
        },
        {
            "condition": "Deletion policy must not abandon the target gRPC proxy from Terraform management",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
