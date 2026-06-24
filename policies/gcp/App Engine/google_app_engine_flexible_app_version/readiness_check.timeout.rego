package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.readiness_check_timeout

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine readiness check timeout is set to an unapproved duration",
            "remedies": ["Have 'readiness_check.timeout' set to an approved duration (within 1s to 10s)"]
        },
        {
            "condition": "Ensure readiness timeout is within 1-10s",
            "attribute_path": ["readiness_check", 0, "timeout"],
            "values": ["1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "10s", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details