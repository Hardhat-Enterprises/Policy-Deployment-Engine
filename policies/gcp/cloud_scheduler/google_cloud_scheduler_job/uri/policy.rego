package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.uri

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "URI is using http",
            "remedies": ["URI must be using https"]
        },
        {
            "condition": "Only the allows the usage of https",
            "attribute_path": ["http_target", 0, "uri"],
            "values": ["*://", [["https"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
