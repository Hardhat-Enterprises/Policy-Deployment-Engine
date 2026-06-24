package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "HTTP method is GET, which ignores request body and may expose data in URL",
            "remedies": [
                "Use POST instead of GET",
                "Ensure sensitive data is sent in request body"
            ]
        },
        {
            "condition": "Checks if http_method is GET",
            "attribute_path": ["http_target", "http_method"],
            "values": ["GET"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details