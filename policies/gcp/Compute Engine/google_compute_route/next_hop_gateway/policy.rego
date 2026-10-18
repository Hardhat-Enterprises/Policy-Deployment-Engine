package terraform.gcp.security.compute_engine.google_compute_route.next_hop_gateway

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_route.vars

conditions := [
    [
        {
            "situation_description": "The route uses GCP's default internet gateway as its next hop, creating a direct internet routing path.",
            "remedies": [
                "Use a controlled internal next hop instead of the default internet gateway where direct internet routing is not required."
            ],
            "match": "any"
        },
        {
            "condition": "next_hop_gateway must not use the short or global default internet gateway value.",
            "attribute_path": ["next_hop_gateway"],
            "values": [
                "default-internet-gateway",
                "global/gateways/default-internet-gateway"
            ],
            "policy_type": "blacklist"
        },
        {
            "condition": "next_hop_gateway must not reference the default internet gateway through a project-relative URL.",
            "attribute_path": ["next_hop_gateway"],
            "values": [
                "projects/*/global/gateways/*",
                [
                    [],
                    ["default-internet-gateway"]
                ]
            ],
            "policy_type": "pattern blacklist"
        },
        {
            "condition": "next_hop_gateway must not reference the default internet gateway through a full Compute API URL.",
            "attribute_path": ["next_hop_gateway"],
            "values": [
                "https://www.googleapis.com/compute/v1/projects/*/global/gateways/*",
                [
                    [],
                    ["default-internet-gateway"]
                ]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details