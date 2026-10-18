package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_oauth_token_scope

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "A broad default OAuth scope is being used for Cloud Tasks requests.",
            "remedies": [
                "Use an OAuth scope that is specific to the target Google service.",
                "Avoid the broad cloud-platform scope where a narrower service-specific scope is available."
            ]
        },
        {
            "condition": "Check whether the broad default OAuth scope is being used.",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "scope"],
            "values": ["https://www.googleapis.com/auth/cloud-platform"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details