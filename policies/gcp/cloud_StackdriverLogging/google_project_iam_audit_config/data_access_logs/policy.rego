package terraform.gcp.security.cloud_StackdriverLogging.google_project_iam_audit_config.data_access_logs

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_project_iam_audit_config.vars

conditions := [
    [
        {
            "situation_description": "Data Access logs are not fully enabled - missing DATA_READ",
            "remedies": [
                "Add DATA_READ audit_log_config block",
                "Example: audit_log_config { log_type = \"DATA_READ\" }"
            ]
        },
        {
            "condition": "Audit config must include DATA_READ",
            "attribute_path": ["audit_log_config", 0, "log_type"],
            "values": ["DATA_READ"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Data Access logs are not fully enabled - missing DATA_WRITE",
            "remedies": [
                "Add DATA_WRITE audit_log_config block",
                "Example: audit_log_config { log_type = \"DATA_WRITE\" }"
            ]
        },
        {
            "condition": "Audit config must include DATA_WRITE",
            "attribute_path": ["audit_log_config", 0, "log_type"],
            "values": ["DATA_WRITE"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}