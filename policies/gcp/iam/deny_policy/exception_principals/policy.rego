package terraform.gcp.security.iam.deny_policy.exception_principals
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.deny_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "exception_principals whitelisting", 
            "remedies": ["Only approved users can be excluded"] 
        },
        {
            "condition" : "c1: exception_principals whitelisting", 
            "attribute_path" : ["rules", 0, "deny_rule", 0,"exception_principals"], 
            "values" : [["principalSet://goog/user/admin@gmail.com"]], 
            "policy_type" : "whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
