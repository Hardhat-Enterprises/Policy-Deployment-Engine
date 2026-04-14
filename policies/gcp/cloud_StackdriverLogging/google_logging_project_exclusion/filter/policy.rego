package terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_exclusion.filter

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_exclusion.vars

conditions := [
    [
        {
            "situation_description": "Stackdriver log exclusion filter is blocking security-relevant audit events",
            "remedies": [
                "Remove exclusions that block cloudaudit.googleapis.com logs",
                "Remove exclusions that block high severity logs (ERROR, CRITICAL, ALERT, EMERGENCY)",
                "Only exclude non-security logs like health checks or debug logs from development"
            ]
        },
        {
            "condition": "Filter must not block audit logs or high severity logs",
            "attribute_path": ["filter"],
            "values": [
                "cloudaudit.googleapis.com",
                "severity >= ERROR",
                "severity >= CRITICAL",
                "logName = \"projects/"
            ],
            "policy_type": "blacklist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details