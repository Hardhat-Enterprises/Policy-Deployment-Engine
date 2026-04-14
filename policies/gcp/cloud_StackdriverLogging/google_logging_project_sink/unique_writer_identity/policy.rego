package terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_sink.unique_writer_identity

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_project_sink.vars

conditions := [
    [
        {
            "situation_description": "Log sink does not use unique writer identity - using default Logging service account",
            "remedies": [
                "Set unique_writer_identity = true to create a dedicated service account for this sink",
                "Required for cross-project log exports and BigQuery options",
                "Provides better security isolation and auditability"
            ]
        },
        {
            "condition": "Sink must use unique writer identity",
            "attribute_path": ["unique_writer_identity"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details