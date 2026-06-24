package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.retry_config_retry_count

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Retry_count is set to excessive retries or minimal amount of retries",
            "remedies": ["Retry_count should be set between 1-3"]
        },
        {
            "condition": "Checks if retry_count is set between 1-3",
            "attribute_path": ["retry_config", 0, "retry_count"],
            "values": [null, 3],
            "policy_type": "range"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
