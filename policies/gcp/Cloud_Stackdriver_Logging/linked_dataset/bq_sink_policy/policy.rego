package terraform.gcp.security.Cloud_Stackdriver_Logging.linked_dataset.bq_sink_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.logging.vars

conditions := [
    
    # Sink naming convention
    [
        {
            "situation_description": "BigQuery sink uses non-standard naming convention.",
            "remedies": ["Use standardized sink naming conventions like 'bq-export-*', 'sink-*', 'export-*'"]
        },
        {
            "condition": "Sink name should follow standard naming conventions",
            "attribute_path": ["name"],
            "values": [["bq-export-*", "sink-*", "export-*", "logs-to-bq-*"]],
            "policy_type": "pattern whitelist"
        }
    ],

    # Destination validation
    [
        {
            "situation_description": "BigQuery sink exports to non-approved datasets.",
            "remedies": ["Only export to approved BigQuery datasets for log analysis"]
        },
        {
            "condition": "Sink destination should be approved BigQuery dataset",
            "attribute_path": ["destination"],
            "values": [["bigquery.googleapis.com/projects/gdce-dev/datasets/audit_logs", "bigquery.googleapis.com/projects/gdce-dev/datasets/security_logs", "bigquery.googleapis.com/projects/gdce-dev/datasets/app_logs"]],
            "policy_type": "whitelist"
        }
    ],

    # Filter validation
    [
        {
            "situation_description": "BigQuery sink uses overly broad filter, potentially exporting sensitive logs.",
            "remedies": ["Use specific filters to only export necessary logs to BigQuery"]
        },
        {
            "condition": "Sink filter should not be overly broad",
            "attribute_path": ["filter"],
            "values": [["*", "severity<ERROR", "severity<WARNING"]],
            "policy_type": "pattern blacklist"
        }
    ],

    # Description requirement
    [
        {
            "situation_description": "BigQuery sink missing description.",
            "remedies": ["Add a descriptive explanation for the purpose of this BigQuery export"]
        },
        {
            "condition": "Sink should have a description",
            "attribute_path": ["description"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.bq_variables).message
details := helpers.get_multi_summary(conditions, vars.bq_variables).details

summary := {
    "message": message,
    "details": details
}