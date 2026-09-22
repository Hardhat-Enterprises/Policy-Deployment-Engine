package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.stackdriver_logging_config_sampling_ratio

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver logging is disabled for Cloud Tasks queue.",
            "remedies": [
                "Set sampling_ratio greater than 0.",
                "Enable logging for monitoring and auditing."
            ]
        },
        {
            "condition": "Check whether sampling_ratio disables operation logging.",
            "attribute_path": ["stackdriver_logging_config", "sampling_ratio"],
            "values": [0, 0.0],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details