package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.predict_request_response_logging_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure Vertex AI Endpoints have request/response logging enabled.",
            "remedies": ["Set `predict_request_response_logging_config.enabled` to true."]
        },
        {
            "condition": "predict_request_response_logging_config.enabled is not set to true",
            "attribute_path": ["predict_request_response_logging_config", "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details