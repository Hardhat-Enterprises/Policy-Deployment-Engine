package terraform.gcp.security.customer_engagement_suite.google_ces_app.logging_settings_bigquery_export_settings_enabled

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
        {
            "situation_description" : "CES app BigQuery export logging is disabled.",
            "remedies" : ["Enable BigQuery export logging for the CES app."]
        },
        {
            "condition" : "BigQuery export logging must be enabled.",
            "attribute_path" : ["logging_settings", 0, "bigquery_export_settings", 0, "enabled"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details