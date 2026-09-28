package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.delete_service_on_destroy

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine service may be deleted when destroying the final version",
            "remedies": ["set 'delete_service_on_destroy' to false"]
        },
        {
            "condition": "Prevent deletion of the parent App Engine service",
            "attribute_path": ["delete_service_on_destroy"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details