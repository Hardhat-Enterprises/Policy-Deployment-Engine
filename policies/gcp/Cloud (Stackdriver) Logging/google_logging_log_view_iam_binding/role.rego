package terraform.gcp.security.cloud_stackdriver_logging.google_logging_log_view_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_log_view_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "Log view IAM role is overly permissive - should use viewAccessor only",
            "remedies": [
                "Use roles/logging.viewAccessor for read-only access",
                "Avoid roles/logging.logWriter (allows log modification)",
                "Avoid roles/logging.privateLogViewer (may expose sensitive data)"
            ]
        },
        {
            "condition": "Role must be viewAccessor only (least privilege)",
            "attribute_path": ["role"],
            "values": ["roles/logging.viewAccessor"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details