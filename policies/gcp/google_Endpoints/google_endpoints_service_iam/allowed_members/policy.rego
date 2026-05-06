package terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.allowed_members

import data.terraform.helpers
import data.terraform.gcp.security.google_Endpoints.google_endpoints_service_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints service IAM members includes a principal outside the approved member types.",
            "remedies": [
                "Use only approved member types in members.",
                "Use user:, group:, or serviceAccount: principals."
            ]
        },
        {
            "condition": "Check that members only use approved principal types.",
            "attribute_path": ["members"],
            "values": ["*", [["user","group","serviceAccount"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

resource_names := [resource.name | resource := input.resource_changes[_]; resource.type == "google_endpoints_service_iam_binding"; resource.name != "c"]

message := sprintf("%s\nResources checked: %s", [
	helpers.get_multi_summary(conditions, vars.variables).message,
	concat(", ", resource_names),
])

details := helpers.get_multi_summary(conditions, vars.variables).details 