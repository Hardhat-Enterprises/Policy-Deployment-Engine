package terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.service_account

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment_api_revision_deployment.vars

conditions := [[
    {
        "situation_description": "The deployed API proxy uses a service account that does not follow the required Google Cloud service account domain pattern.",
        "remedies": [
            "Configure service_account using the domain '<account>@<project>.iam.gserviceaccount.com'.",
            "Use a dedicated least-privilege service account for the deployed API proxy."
        ]
    },
    {
        "condition": "service_account uses the Google Cloud service account domain",
        "attribute_path": ["service_account"],
        "values": [
            "iam.*.com",
            [
                ["gserviceaccount"]
            ]
        ],
        "policy_type": "pattern whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
