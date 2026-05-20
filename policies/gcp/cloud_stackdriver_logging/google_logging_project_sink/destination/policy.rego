package terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_sink.destination

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_sink.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver log sink destination is not within the organization's approved domains/buckets",
            "remedies": [
                "Use approved destination patterns: storage.googleapis.com/YOUR_BUCKET, bigquery.googleapis.com/projects/YOUR_PROJECT/datasets/YOUR_DATASET, or pubsub.googleapis.com/projects/YOUR_PROJECT/topics/YOUR_TOPIC, logging.googleapis.com/projects/YOUR_PROJECT/locations/global/buckets/YOUR_BUCKET",
                "Ensure destination is within your organization's GCP project"
            ]
        },
        {
            "condition": "Destination must be an approved GCP service",
            "attribute_path": ["destination"],
            "values": [
                "storage.googleapis.com/audit-logs-bucket",
                "bigquery.googleapis.com/projects/security-project/datasets/audit_logs",
                "pubsub.googleapis.com/projects/attacker-project/topics/logs",
                "https://malicious-site.com/logs"
            ],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details