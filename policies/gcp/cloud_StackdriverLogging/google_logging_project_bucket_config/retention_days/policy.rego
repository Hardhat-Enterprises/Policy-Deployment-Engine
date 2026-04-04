package terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_bucket_config.retention_days

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_bucket_config.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver log retention period is insufficient for compliance requirements",
            "remedies": [
                "Set retention_days to 30 days or higher (recommended: 90+ days for audit logs)",
                "Minimum retention: 30 days, Recommended: 90 days, Maximum: 3650 days"
            ]
        },
        {
            "condition": "retention_days must be at least 30 days",
            "attribute_path": ["retention_days"],
            "values": [30, 3650],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}