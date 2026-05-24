package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.rate_limits

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "No rate limits configured, allowing uncontrolled task dispatch",
            "remedies": [
                "Define rate_limits block",
                "Set max_dispatches_per_second and max_concurrent_dispatches"
            ]
        },
        {
            "condition": "Checks if rate_limits is missing",
            "attribute_path": ["rate_limits"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details