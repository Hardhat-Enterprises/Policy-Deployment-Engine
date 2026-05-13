package terraform.gcp.security.google_endpoints.google_endpoints_service.openapi_config

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service openapi_config allows HTTP.",
            "remedies": [
                "Remove http from the OpenAPI schemes section.",
                "Allow only https in openapi_config."
            ]
        },
       {
                "condition": "Google Cloud Endpoints service openapi_config must not allow http in the OpenAPI schemes section.",
                "attribute_path": ["openapi_config"],
                "values": ["swagger: \"2.0\"\r\ninfo:\r\n  title: \"secure-api\"\r\n  version: \"1.0.0\"\r\nhost: \"api.endpoints.my-project-12345.cloud.goog\"\r\nschemes:\r\n  - http\r\npaths:\r\n  /hello:\r\n    get:\r\n      operationId: hello\r\n      responses:\r\n        200:\r\n          description: OK\r\n"],
                "policy_type": "blacklist"
       }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details

