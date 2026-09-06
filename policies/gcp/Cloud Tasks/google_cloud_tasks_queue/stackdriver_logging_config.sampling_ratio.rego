package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.stackdriver_logging_config_sampling_ratio

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [

    # Logging disabled
    [
        {
            "situation_description": "Stackdriver logging is disabled for Cloud Tasks queue",
            "remedies": [
                "Set sampling_ratio greater than 0",
                "Enable logging for monitoring and auditing"
            ]
        },
        {
            "condition": "Checks if sampling_ratio is 0",
            "attribute_path": ["stackdriver_logging_config", "sampling_ratio"],
            "values": [0, 0.0],
            "policy_type": "blacklist"
        }
    ],

    # Logging too low
    [
        {
            "situation_description": "Logging level is too low, reducing visibility of operations",
            "remedies": [
                "Increase sampling_ratio to at least 0.5",
                "Ensure sufficient logging for monitoring"
            ]
        },
        {
            "condition": "Checks if sampling_ratio is too low",
            "attribute_path": ["stackdriver_logging_config", "sampling_ratio"],
            "values": [0.5, 1.0],
            "policy_type": "range"
        }
    ]

]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
