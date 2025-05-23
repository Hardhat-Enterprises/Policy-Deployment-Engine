package terraform.gcp.security.iam.deny_policy.exception_permissions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.deny_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "exception_permissions not empty", 
            "remedies": ["No permission should be excluded"] 
        },
        {
            "condition" : "c1: exception_permissions not empty", 
            "attribute_path" : ["rules", 0, "deny_rule", 0,"exception_permissions"], 
            "values" : [[""]], 
            "policy_type" : "whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
