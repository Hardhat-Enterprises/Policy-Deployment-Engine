package terraform.gcp.security.compute_engine.google_compute_router_nat_address.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat_address.vars

conditions := [
    [
        {
            "situation_description": "Router NAT Address may be abandoned and left outside Terraform management",
            "remedies": [
                "Do not set deletion_policy to ABANDON"
            ]
        },
        {
            "condition": "Deletion policy must not abandon the NAT address from Terraform management",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
