package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint uses a valid VPC network resource path. Note: Private Service Connect (PSC) is explicitly disallowed by this policy to enforce strict VPC peering.",
            "remedies": ["Set the `network` attribute to a valid VPC path matching projects/*/global/networks/*."]
        },
        {
            "condition": "network does not match valid VPC pattern",
            "attribute_path": ["network"],
            "values": ["^projects/[^/]+/global/networks/[^/]+$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint network is not empty, default, or a placeholder literal.",
            "remedies": ["Provide a real VPC network path."]
        },
        {
            "condition": "network is an invalid literal",
            "attribute_path": ["network"],
            "values": ["", "default", "not-a-real-network"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details