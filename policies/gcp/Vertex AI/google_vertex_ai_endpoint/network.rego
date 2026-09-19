package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "When network is set, it must match the VPC path shape.",
            "remedies": ["Ensure network is a valid VPC path if configured."]
        },
        {
            "condition": "network is an invalid literal format",
            "attribute_path": ["network"],
            "values": ["default", "not-a-valid-vpc-path"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details