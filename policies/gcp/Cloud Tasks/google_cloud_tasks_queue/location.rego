package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "The Cloud Tasks queue is deployed outside the approved regions, which may violate data residency or organisational location requirements.",
            "remedies": [
                "Deploy the queue in an approved region.",
                "Use an organisation-approved regional whitelist that reflects data residency and compliance requirements."
            ]
        },
        {
            "condition": "Check whether the Cloud Tasks queue location is in the approved region whitelist.",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details