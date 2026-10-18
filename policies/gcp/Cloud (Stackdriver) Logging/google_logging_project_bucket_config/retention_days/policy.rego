package terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_bucket_config.retention_days

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_bucket_config.vars

conditions := [
    [
        {
            "situation_description": "Log retention period is insufficient for compliance requirements",
            "remedies": [
                "Set retention_days to at least 30 days (minimum compliance requirement)",
                "Recommended: 90+ days for audit logs",
                "Maximum: 3650 days"
            ]
        },
        {
            "condition": "retention_days must be at least 30 days",
            "attribute_path": ["retention_days"],
            "values": [30, 3650],
            "policy_type": "range"
        }
    ],
    [
        {
            "situation_description": "Audit log retention period is below recommended 90 days",
            "remedies": [
                "Set retention_days to 90 days or higher for audit logs",
                "CIS GCP Benchmark recommends 90+ days for audit log retention"
            ]
        },
        {
            "condition": "retention_days should be 90 days or higher for audit compliance",
            "attribute_path": ["retention_days"],
            "values": [90, 3650],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details