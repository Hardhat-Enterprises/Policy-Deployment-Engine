package terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_bucket_config.locked

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_bucket_config.vars

conditions := [
    [
        {
            "situation_description": "Log bucket is not locked - retention can be reduced or bucket can be deleted, compromising audit trail integrity",
            "remedies": [
                "Set locked = true to prevent retention reduction and bucket deletion",
                "Note: This setting is permanent and cannot be undone once applied",
                "Required for compliance with legal hold and audit log preservation"
            ]
        },
        {
            "condition": "Log bucket must be locked for compliance",
            "attribute_path": ["locked"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details