package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.paused

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Paused has not been set to either true or false",
            "remedies": ["Paused should be configured to either true or false"]
        },
        {
            "condition": "Paused is not set or set to null",
            "attribute_path": ["paused"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details