package terraform.gcp.security.customer_engagement_suite.google_ces_agent.location
import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars


conditions := [
    [
    {"situation_description" : "Agent must be deployed in an approved region.",
    "remedies":["Deploy the resource in an approved region."]},
    {
        "condition": "Location must be in the approved region list.",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1"], 
        "policy_type" : "whitelist" 
    }
    ]
]
 
    
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details