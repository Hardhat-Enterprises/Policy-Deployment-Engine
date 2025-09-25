package terraform.gcp.security.deploy.target.require_approval_check 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

conditions := [
    [
    {"situation_description" : "Target doesn't require approval",
    "remedies":[ "Target must require approval"]},
    {
        "condition": "Target doesn't require approval",
        "attribute_path" : ["require_approval"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details