package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_uri_override_scheme

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "The Cloud Tasks URI override uses HTTP, which does not provide transport encryption.",
            "remedies": [
                "Set the URI override scheme to HTTPS.",
                "Use HTTPS endpoints to protect task traffic in transit."
            ]
        },
        {
            "condition": "Check whether the URI override scheme is HTTPS.",
            "attribute_path": ["http_target", 0, "uri_override", 0, "scheme"],
            "values": ["HTTPS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details