package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint does not use the default VPC network.",
            "remedies": ["Set the `network` attribute to a custom VPC network."]
        },
        {
            "condition": "network is set to default",
            "attribute_path": ["network"],
            "values": ["default"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details