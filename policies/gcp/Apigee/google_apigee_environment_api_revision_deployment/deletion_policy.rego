package terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.vars

conditions := [
    [
        {
            "situation_description": "The deployed Apigee API revision is not protected against deletion, which could remove the deployed proxy and its associated security controls.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review and approve any intentional removal of the deployed API revision.",
                "Confirm that an approved replacement deployment exists before removing the current revision."
            ]
        },
        {
            "condition": "Check whether deletion_policy is set to PREVENT.",
            "attribute_path": [
                "deletion_policy"
            ],
            "values": [
                "PREVENT"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the result
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
