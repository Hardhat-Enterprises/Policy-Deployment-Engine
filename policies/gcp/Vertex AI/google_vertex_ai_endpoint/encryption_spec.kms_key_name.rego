package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.enable_private_service_connect

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint is exposed via Private Service Connect instead of the public internet.",
            "remedies": ["Set `private_service_connect_config.enable_private_service_connect` to true."]
        },
        {
            "condition": "enable_private_service_connect is not true",
            "attribute_path": ["private_service_connect_config", 0, "enable_private_service_connect"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details