package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.liveness_check_timeout

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine liveness check timeout is set to an unapproved duration",
            "remedies": ["set 'liveness_check.timeout' to an approved duration (within 1s to 10s')"]
        },
        {
            "condition": "Whitelist approved timeout durations",
            "attribute_path": ["liveness_check", 0, "timeout"],
            "values": ["1s", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "10s", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details