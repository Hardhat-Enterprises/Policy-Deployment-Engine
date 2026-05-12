package terraform.gcp.security.google_Endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config does not enforce HTTPS.",
            "remedies": [
                "Add https to the schemes section.",
                "Allow only https in openapi_config."
            ]
        },
        {
            "condition": "Check that openapi_config uses the approved HTTPS OpenAPI configuration.",
            "attribute_path": ["openapi_config"],
            "values": ["swagger: \"2.0\"\r\ninfo:\r\n  title: \"secure-api\"\r\n  version: \"1.0.0\"\r\nhost: \"api.endpoints.my-project-12345.cloud.goog\"\r\nschemes:\r\n  - https\r\npaths:\r\n  /hello:\r\n    get:\r\n      operationId: hello\r\n      responses:\r\n        200:\r\n          description: OK\r\n"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details