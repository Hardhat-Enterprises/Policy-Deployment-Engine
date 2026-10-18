package terraform.gcp.security.compute_engine.google_compute_target_grpc_proxy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_grpc_proxy.vars

conditions := [
    [
        {
            "situation_description": "Target gRPC Proxy may remain active after being abandoned from Terraform management",
            "remedies": [
                "Use DELETE for normal teardown or PREVENT when retention is required; do not use ABANDON"
            ]
        },
        {
            "condition": "Deletion policy must not leave the target gRPC proxy unmanaged",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
