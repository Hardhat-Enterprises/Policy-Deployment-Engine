package terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_sink.destination

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_sink.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver log sink destination is not within the organization's approved domains/buckets",
            "remedies": [
                "Use approved destination patterns: storage.googleapis.com/YOUR_BUCKET, bigquery.googleapis.com/projects/YOUR_PROJECT/datasets/YOUR_DATASET, or pubsub.googleapis.com/projects/YOUR_PROJECT/topics/YOUR_TOPIC",
                "Ensure destination is within your organization's GCP project"
            ]
        },
        {
            "condition": "Destination must not be external or unauthorized",
            "attribute_path": ["destination"],
            "values": ["pubsub.googleapis.com/projects/", "storage.googleapis.com/", "bigquery.googleapis.com/projects/"],
            "policy_type": "whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details