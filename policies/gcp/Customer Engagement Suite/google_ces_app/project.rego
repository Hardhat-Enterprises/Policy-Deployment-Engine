package terraform.gcp.security.customer_engagement_suite.google_ces_app.project
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app is deployed outside the approved google cloud project.",
        "remedies":[ "Deploy the CES app in the approved Google Cloud project."]
    },
    {
        "condition": "Project must be an approved value.",
        "attribute_path" : ["project"],
        "values" : ["my-project"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
