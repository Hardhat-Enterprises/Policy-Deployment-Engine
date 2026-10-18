package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.region

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Scheduler job resides outside of australia",
            "remedies": ["Scheduler job should be from a region in Australia"]
        },
        {
            "condition": "Region is set to an Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details