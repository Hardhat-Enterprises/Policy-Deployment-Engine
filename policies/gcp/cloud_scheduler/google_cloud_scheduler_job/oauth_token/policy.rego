package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.oauth_token

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "Oauth_token is not implented",
            "remedies": ["Please use and configure an Oauth_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "Oauth_token must be configured and used",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "service_account_email"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
