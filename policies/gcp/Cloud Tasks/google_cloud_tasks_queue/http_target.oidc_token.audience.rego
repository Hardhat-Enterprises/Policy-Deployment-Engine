package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_oidc_token_audience

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "The OIDC token audience is not an approved target for Cloud Tasks requests.",
            "remedies": [
                "Set the audience to an organisation-approved receiving service.",
                "Maintain an approved audience allowlist that reflects the intended target services."
            ]
        },
        {
            "condition": "Check whether the OIDC token audience is in the approved target allowlist.",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "audience"],
            "values": ["https://tasks-target.example.com"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details