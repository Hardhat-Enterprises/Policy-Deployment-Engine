package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint mandates a valid private network peering configuration.",
            "remedies": ["Set the `network` attribute to a valid VPC network path."]
        },
        {
            "condition": "network is missing or set to default",
            "attribute_path": ["network"],
            "values": [null, "", "default"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details