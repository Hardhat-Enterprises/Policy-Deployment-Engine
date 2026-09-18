package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint uses a valid VPC network resource path. Note: For this specific environment, PSC-only endpoints are not a supported configuration, and VPC peering presence is strictly mandated as the exclusive security control.",
            "remedies": ["Set the `network` attribute to a valid VPC path matching ^projects/[^/]+/global/networks/[^/]+$"]
        },
        {
            "condition": "network does not match valid VPC pattern or is missing",
            "attribute_path": ["network"],
            "values": ["^projects/[^/]+/global/networks/[^/]+$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Ensure Vertex AI Endpoint uses a valid VPC network resource path. Note: For this specific environment, PSC-only endpoints are not a supported configuration, and VPC peering presence is strictly mandated as the exclusive security control.",
            "remedies": ["Provide a real VPC network path."]
        },
        {
            "condition": "network is missing, empty, or an invalid literal",
            "attribute_path": ["network"],
            "values": [null, "", "not-a-valid-vpc-path"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details