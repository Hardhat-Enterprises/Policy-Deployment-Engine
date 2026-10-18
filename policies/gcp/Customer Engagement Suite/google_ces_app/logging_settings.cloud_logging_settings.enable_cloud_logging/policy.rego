package terraform.gcp.security.customer_engagement_suite.google_ces_app.logging_settings_cloud_logging_settings_enable_cloud_logging

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description" : "CES app Cloud Logging is disabled.",
            "remedies" : ["Enable Cloud Logging for the CES app."]
        },
        {
            "condition" : "Cloud Logging must be enabled.",
            "attribute_path" : ["logging_settings", 0, "cloud_logging_settings", 0, "enable_cloud_logging"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details