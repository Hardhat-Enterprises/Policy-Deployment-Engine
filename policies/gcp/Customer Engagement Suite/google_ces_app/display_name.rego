package terraform.gcp.security.customer_engagement_suite.google_ces_app.display_name
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app display names does not follow approved naming standards.",
        "remedies":[ "Use an approved display name for the CES app."]
    },
    {
        "condition": "Display name must be an approved value.",
        "attribute_path" : ["display_name"],
        "values" : ["my-app"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
