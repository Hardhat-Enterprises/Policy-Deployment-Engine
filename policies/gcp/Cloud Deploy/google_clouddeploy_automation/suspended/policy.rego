package terraform.gcp.security.deploy.automation.suspended
import data.terraform.helpers
import data.terraform.gcp.security.deploy.automation.vars

conditions := [
    [
    {"situation_description" : "Automation is suspended",
    "remedies":[ "Automation should not be suspended for active deployment"]},
    {
        "condition": "Automation is suspended",
        "attribute_path" : ["suspended"], 
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
