package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.scope

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "broad default scope is being used",
            "remedies": ["Scope must be specfic to the service"]
        },
        {
            "condition": "Stops the usage of the default broad scope",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "scope"],
            "values": ["https://www.googleapis.com/auth/cloud-platform"],
            "policy_type": "blacklist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
