package terraform.gcp.security.google_Endpoints.google_endpoints_service.service_name

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service service_name does not follow the expected Cloud Endpoints domain format for the configured project.",
            "remedies": [
                "Set service_name to use the Cloud Endpoints format.",
                "Ensure service_name ends with .endpoints.<project>.cloud.goog."
            ]
        },
        {
            "condition": "Check that service_name matches the configured project in the Cloud Endpoints domain format.",
            "attribute_path": ["service_name"],
            "values": ["*.endpoints.*.cloud.goog", []],
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

details := helpers.get_multi_summary(conditions, vars.variables).details 