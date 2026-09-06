package terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.service_account

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.vars

conditions := [
    [
        {
            "situation_description": "The deployed Apigee API proxy does not have an explicitly configured service account for its runtime identity, which could result in the use of an unintended identity.",
            "remedies": [
                "Configure service_account for the deployed API proxy.",
                "Use a dedicated service account instead of a default or shared identity.",
                "Grant the service account only the permissions required by the API proxy."
            ]
        },
        {
            "condition": "Check whether the deployed API proxy has an explicitly configured service account.",
            "attribute_path": [
                "service_account"
            ],
            "values": [
                null,
                ""
            ],
            "policy_type": "blacklist"
        }
    ]
]

# Evaluates the conditions once and stores the result
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
