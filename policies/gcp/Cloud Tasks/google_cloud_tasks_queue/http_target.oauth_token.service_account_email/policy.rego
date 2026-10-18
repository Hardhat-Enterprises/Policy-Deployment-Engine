package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_oauth_token_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "A default Google-managed service account is being used to generate OAuth tokens for Cloud Tasks requests.",
            "remedies": [
                "Use a dedicated, intentionally selected service account for Cloud Tasks.",
                "Grant the service account only the IAM roles required by the target service."
            ]
        },
        {
            "condition": "OAuth token service_account_email must not use a default Google-managed service account.",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "service_account_email"],
            "values": ["@*", [["developer.gserviceaccount.com", "appspot.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details