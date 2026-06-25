package terraform.gcp.security.deploy.google_clouddeploy_target.require_approval
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_target.vars

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
