package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.body

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "http_method is being configured to a method that is only allowed with the body",
            "remedies": ["Set http_method to a method POST, PUT, PATCH when body is in use"]
        },
        {
            "condition": "Checks if http_method is using an allowed method",
            "attribute_path": ["http_target", 0, "http_method"],
            "values": ["POST", "PUT", "PATCH"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Checks if body is being used",
            "attribute_path": ["http_target", 0, "body"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details