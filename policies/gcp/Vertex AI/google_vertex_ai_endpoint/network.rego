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
            "condition": "network is improperly configured",
            "attribute_path": ["network"],
            "values": ["projects/my-project/global/networks/invalid-network"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details