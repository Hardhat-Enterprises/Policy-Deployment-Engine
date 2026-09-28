package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.http_target_uri

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "The scheduler job calls its target over plain HTTP, so the request body, headers and any OIDC token it carries travel unencrypted and can be read or altered in transit.",
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
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
