package terraform.gcp.security.google_Endpoints.google_endpoints_service.grpc_config

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

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
            "values": ["*", []],
            "policy_type": "pattern whitelist"
        },
        {
            "condition": "Check that protoc_output_base64 is configured.",
            "attribute_path": ["protoc_output_base64"],
            "values": ["*", []],
            "policy_type": "pattern whitelist"
        }
    ] 
]

resource_names := [resource.name | resource := input.resource_changes[_]; resource.type == "google_endpoints_service"; resource.name != "c"]

message := sprintf("%s\nResources checked: %s", [
	helpers.get_multi_summary(conditions, vars.variables).message,
	concat(", ", resource_names),
])

details := helpers.get_multi_summary(conditions, vars.variables).details