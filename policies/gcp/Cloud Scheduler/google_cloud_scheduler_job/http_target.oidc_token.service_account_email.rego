package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.http_target_oidc_token_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Oidc_token is not implented",
            "remedies": ["Please use and configure an Oidc_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "Oidc_token must be configured and used",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "service_account_email"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
