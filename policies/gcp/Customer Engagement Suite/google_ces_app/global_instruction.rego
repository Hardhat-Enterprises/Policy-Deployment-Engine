package terraform.gcp.security.customer_engagement_suite.google_ces_app.global_instruction
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app does not define global instruction for its AI agents.",
        "remedies":[ "Define an approved global instruction for the CES app."]
    },
    {
        "condition": "Global instruction must be provided.",
        "attribute_path" : ["global_instruction"],
        "values" : ["Follow approved security and data handling requirements."],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details