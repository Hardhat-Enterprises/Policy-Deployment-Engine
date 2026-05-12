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
            "condition": "Check that openapi_config includes https in the OpenAPI schemes section.",
            "attribute_path": ["openapi_config"],
            "values": ["*https*", []],
            "policy_type": "pattern whitelist"
        }
    ]
]

resource_names := [resource.name |
    resource := input.resource_changes[_]
    resource.type == "google_endpoints_service"
    resource.name != "c"
]

message := sprintf("%s\nResources checked: %s", [
    helpers.get_multi_summary(conditions, vars.variables).message,
    concat(", ", resource_names),
])

details := helpers.get_multi_summary(conditions, vars.variables).details