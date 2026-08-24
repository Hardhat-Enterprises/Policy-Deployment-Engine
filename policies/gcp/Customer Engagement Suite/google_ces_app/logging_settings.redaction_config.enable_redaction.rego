package terraform.gcp.security.customer_engagement_suite.google_ces_app.logging_settings_redaction_config_enable_redaction

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description" : "CES app sensitive data redaction is not enabled.",
            "remedies" : ["Enable redaction of sensitive information in CES app logs and recordings."]
        },
        {
            "condition" : "Sensitive data redaction must be enabled.",
            "attribute_path" : ["logging_settings", 0, "redaction_config", 0, "enable_redaction"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details