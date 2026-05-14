package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.rate_limits

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [

    # Missing rate limits
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
    ],

    # Dispatch rate too high
    [
        {
            "situation_description": "Dispatch rate is too high, risking backend overload",
            "remedies": [
                "Reduce max_dispatches_per_second (≤ 100)"
            ]
        },
        {
            "condition": "Checks if max_dispatches_per_second exceeds safe threshold",
            "attribute_path": ["rate_limits", "max_dispatches_per_second"],
            "values": [null, 1000],
            "policy_type": "blacklist"
        }
    ],

    # Too many concurrent dispatches
    [
        {
            "situation_description": "Too many concurrent dispatches may cause resource exhaustion",
            "remedies": [
                "Reduce max_concurrent_dispatches (≤ 10)"
            ]
        },
        {
            "condition": "Checks if max_concurrent_dispatches exceeds safe threshold",
            "attribute_path": ["rate_limits", "max_concurrent_dispatches"],
            "values": [100],
            "policy_type": "blacklist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details