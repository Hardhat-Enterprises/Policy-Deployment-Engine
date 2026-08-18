package terraform.gcp.security.customer_engagement_suite.google_ces_app.tool_execution_mode
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
    [
    {
        "situation_description" : "CES app must use an approved tool execution mode.",
        "remedies":[ "Set tool_execution_mode to PARALLEL or SEQUENTIAL."]
    },
    {
        "condition": "Tool execution mode must be approved.",
        "attribute_path" : ["tool_execution_mode"],
        "values" : ["PARALLEL", "SEQUENTIAL"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details