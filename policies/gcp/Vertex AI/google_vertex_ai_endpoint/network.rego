package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "When VPC network peering is used, the configured network should reference an approved VPC network resource path.",
            "remedies": ["Ensure the `network` attribute references a valid VPC path if configured."]
        },
        {
            "condition": "network is set to an invalid non-empty literal",
            "attribute_path": ["network"],
            "values": ["not-a-valid-vpc-path"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details