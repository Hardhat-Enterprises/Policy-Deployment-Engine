package terraform.gcp.security.customer_engagement_suite.google_ces_app.guardrails
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app does not define approved guardrails.",
        "remedies":[ "Configure guardrails for the CES app."]
    },
    {
        "condition": "Guardrails must be configured.",
        "attribute_path" : ["guardrails"],
        "values" : ["projects/my-project/locations/us/apps/my-app/guardrails/approved-guardrail"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
