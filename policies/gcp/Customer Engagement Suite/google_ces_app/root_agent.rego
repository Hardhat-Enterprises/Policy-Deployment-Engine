package terraform.gcp.security.customer_engagement_suite.google_ces_app.root_agent
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
 [
    {
        "situation_description" : "CES app must use an approved root agent.",
        "remedies":[ "Configure the CES app with an approved root agent."]
    },
    {
        "condition": "Root agent must be an approved value.",
        "attribute_path" : ["root_agent"],
        "values" : ["projects/my-project/locations/us/apps/my-app/agents/approved-root-agent"],
        "policy_type" : "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details