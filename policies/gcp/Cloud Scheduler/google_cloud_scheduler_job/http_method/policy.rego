package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.http_method

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "http_method is being configured to a method that can be used to malicious purposes",
            "remedies": ["Set http_method to a method other than DELETE, PATCH, PUT "]
        },
        {
            "condition": "Checks if http_method is using a method that can be used for malicious intent",
            "attribute_path": ["http_target", 0, "http_method"],
            "values": ["DELETE", "OPTIONS"],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details