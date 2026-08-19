package terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.service_account

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.vars

conditions := [
    [
        {
            "situation_description": "The deployed Apigee API proxy does not use an approved, dedicated service account for its runtime identity, which could grant the proxy unnecessary access to Google Cloud resources.",
            "remedies": [
                "Set service_account to an approved dedicated Apigee runtime service account.",
                "Grant the service account only the permissions required by the deployed API proxy.",
                "Avoid default, shared, user-managed, or broadly privileged service accounts."
            ]
        },
        {
            "condition": "Check whether the deployed API proxy uses an approved runtime service account.",
            "attribute_path": [
                "service_account"
            ],
            "values": [
                "apigee-runtime@example-project.iam.gserviceaccount.com"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
