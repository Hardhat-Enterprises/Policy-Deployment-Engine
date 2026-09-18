package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint network is not empty or set to default.",
            "remedies": ["Set the `network` attribute to a custom VPC."]
        },
        {
            "condition": "network is empty, default, or invalid literal",
            "attribute_path": ["network"],
            "values": ["", "default", "not-a-real-network"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint uses a valid VPC network resource path.",
            "remedies": ["Set `network` to match projects/*/global/networks/*."]
        },
        {
            "condition": "network does not match VPC pattern",
            "attribute_path": ["network"],
            "values": ["^projects/[^/]+/global/networks/[^/]+$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details