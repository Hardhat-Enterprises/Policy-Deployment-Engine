package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_oidc_token_audience

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "The OIDC token audience is not explicitly configured for Cloud Tasks requests.",
            "remedies": [
                "Set an explicit audience that matches the intended receiving service.",
                "Use an organisation-approved target audience for OIDC token validation."
            ]
        },
        {
            "condition": "OIDC token audience must be explicitly configured.",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "audience"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details