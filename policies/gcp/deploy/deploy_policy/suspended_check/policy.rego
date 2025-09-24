package terraform.gcp.security.deploy.deploy_policy.suspended_check
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.deploy_policy.vars

conditions := [
    [
        {
            "situation_description" : "Deploy policy is suspended",
            "remedies":[ "Deploy Policy should not be suspended for active deployment" ]},
        {
            "condition": "Deploy policy is suspended",
            "attribute_path" : ["suspended"], 
            "values" : [false], 
            "policy_type" : "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details