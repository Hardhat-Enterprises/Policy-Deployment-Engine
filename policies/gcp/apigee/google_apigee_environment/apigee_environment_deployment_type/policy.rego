package terraform.gcp.security.apigee.google_apigee_environment.apigee_environment_deployment_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment.vars

conditions := [
    [
        {
            "situation_description": "Apigee Environment deployment_type is set to DEPLOYMENT_TYPE_UNSPECIFIED which may lead to unpredictable deployment behaviour",
            "remedies": [
                "Set deployment_type to PROXY for standard API proxy deployments",
                "Set deployment_type to ARCHIVE for archive-based deployments"
            ]
        },
        {
            "condition": "Check that deployment_type is not DEPLOYMENT_TYPE_UNSPECIFIED",
            "attribute_path": ["deployment_type"],
            "values": ["DEPLOYMENT_TYPE_UNSPECIFIED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details