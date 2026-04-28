package terraform.gcp.security.apigee.google_apigee_environment.apigee_environment_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment.vars

conditions := [
    [
        {
            "situation_description": "Apigee Environment type is set to ENVIRONMENT_TYPE_UNSPECIFIED which does not enforce a defined capability and capacity tier",
            "remedies": [
                "Set type to BASE for basic environment capabilities",
                "Set type to INTERMEDIATE for standard environment capabilities",
                "Set type to COMPREHENSIVE for full environment capabilities"
            ]
        },
        {
            "condition": "Check that environment type is not ENVIRONMENT_TYPE_UNSPECIFIED",
            "attribute_path": ["type"],
            "values": ["ENVIRONMENT_TYPE_UNSPECIFIED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details