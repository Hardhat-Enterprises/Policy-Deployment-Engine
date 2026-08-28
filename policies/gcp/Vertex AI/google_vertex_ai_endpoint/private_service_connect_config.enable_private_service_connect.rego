package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.private_service_connect_config_enable_private_service_connect

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint uses Customer-Managed Encryption Keys (CMEK).",
            "remedies": ["Provide a valid KMS key via the `encryption_spec` block."]
        },
        {
            "condition": "encryption_spec block is missing",
            "attribute_path": ["encryption_spec"],
            "policy_type": "presence"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details