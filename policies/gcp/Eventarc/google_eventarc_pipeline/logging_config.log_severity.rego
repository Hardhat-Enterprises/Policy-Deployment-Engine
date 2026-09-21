package terraform.gcp.security.eventarc.google_eventarc_pipeline.logging_config_log_severity

import data.terraform.helpers
import data.terraform.gcp.security.eventarc.google_eventarc_pipeline.vars

conditions := [
    [
        {"situation_description" : "Platform Telemetry logging is disabled for the Pipeline, leaving message processing and failures unaudited.",
        "remedies":[ "Set logging_config.log_severity to a severity other than NONE so Pipeline activity is logged."]},
        {
            "condition": "log_severity must not be NONE",
            "attribute_path" : ["logging_config", 0, "log_severity"],
            "values" : ["NONE"],
            "policy_type" : "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
