package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.retry_config_max_attempts

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "Cloud Tasks queue allows unlimited retries",
            "remedies": [
                "Avoid setting max_attempts to -1"
            ]
        },
        {
            "condition": "Checks if max_attempts is set to unlimited (-1)",
            "attribute_path": ["retry_config", "max_attempts"],
            "values": [-1],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
