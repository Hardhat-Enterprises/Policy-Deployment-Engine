package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints are connected to a designated VPC network.",
            "remedies": ["Configure the `network` attribute."]
        },
        {
            "condition": "network is not in the approved list",
            "attribute_path": ["network"],
            "values": ["projects/123456789/global/networks/my-secure-vpc"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details