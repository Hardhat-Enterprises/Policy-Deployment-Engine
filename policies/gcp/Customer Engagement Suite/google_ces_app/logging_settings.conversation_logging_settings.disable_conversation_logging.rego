package terraform.gcp.security.customer_engagement_suite.google_ces_app.logging_settings_conversation_logging_settings_disable_conversation_logging

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description" : "CES app conversation logging is disabled.",
            "remedies" : ["Keep conversation logging enabled for the CES app."]
        },
        {
            "condition" : "Conversation logging must not be disabled.",
            "attribute_path" : ["logging_settings", 0, "conversation_logging_settings", 0, "disable_conversation_logging"],
            "values" : [true],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details