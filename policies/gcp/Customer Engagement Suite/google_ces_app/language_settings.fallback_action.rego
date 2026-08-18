package terraform.gcp.security.customer_engagement_suite.google_ces_app.language_settings_fallback_action
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES unsupported-language handling must use an apporved fallback action.",
        "remedies":["Use an approved fallback action such as escalate or exit."]
    },
    {
        "condition": "Fallback action must be approved.",
        "attribute_path" : ["language_settings", "fallback_action"],
        "values" : ["escalate", "exit"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
