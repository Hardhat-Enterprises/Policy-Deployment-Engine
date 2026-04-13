package terraform.gcp.security.cloud_composer.google_composer_environment.restricted_service_account

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_environment.vars

conditions := [

    [
        {
            "situation_description": "The environment is using a service account that is not approved by your organization.",
            "remedies": [
                "Use a pre-approved service account listed in the organization policy.",
                "Refer to Cloud Composer documentation for specifying node_config.service_account."
            ]
        },
        {
            "condition": "Check if service account is in the disallowed blacklist",
            "attribute_path": ["config", 0, "node_config", 0, "service_account"],
            "values": ["unauthorized-sa@my-project.iam.gserviceaccount.com", "123456789012-compute@developer.gserviceaccount.com"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details