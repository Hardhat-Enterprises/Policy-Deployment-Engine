package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.time_zone

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Timezone is set to a region outside of australia",
            "remedies": ["Use an Australian timezone only."]
        },
        {
            "condition": "Timezone is set to an Australian timezone",
            "attribute_path": ["time_zone"],
            "values": ["Australia/Sydney", "Australia/Melbourne", "Australia/Brisbane", "Australia/Hobart", "Australia/Adelaide", "Australia/Darwin", "Australia/Perth", "Australia/Eucla", "Australia/Lord_Howe", "Australia/Lindeman", "Australia/Broken_Hill", "Australia/Currie"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
