package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "When network is set, it must be a VPC network path (projects/*/global/networks/*).",
            "remedies": ["Ensure the `network` attribute matches the VPC network path format: projects/*/global/networks/*"]
        },
        {
            "condition": "network is explicitly set but does not match the required VPC path shape",
            "attribute_path": ["network"],
            "values": ["projects/*/global/networks/*"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details