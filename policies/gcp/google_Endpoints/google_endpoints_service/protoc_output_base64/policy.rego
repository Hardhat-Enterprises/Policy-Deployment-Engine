package terraform.gcp.security.google_endpoints.google_endpoints_service.protoc_output_base64

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service grpc_config is set without protoc_output_base64.",
            "remedies": [
                "Set protoc_output_base64 when grpc_config is configured."
            ]
        },
        {
            "condition": "Check that grpc_config is configured.",
            "attribute_path": ["grpc_config"],
            "values": ["", null],
            "policy_type": "blacklist"
        },
        {
            "condition": "Check that protoc_output_base64 is configured.",
            "attribute_path": ["protoc_output_base64"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
