package terraform.gcp.security.customer_engagement_suite.google_ces_app.location
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app location does not follow appporved location standards.",
        "remedies":[ "Use an approved location for the CES app."]
    },
    {
        "condition": "Location must be an approved value.",
        "attribute_path" : ["location"],
        "values" : ["us"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
