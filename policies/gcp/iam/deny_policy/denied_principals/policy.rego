package terraform.gcp.security.iam.deny_policy.denied_principals
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.deny_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "public principals should be in denied principal", 
            "remedies": ["This resource should deny all public access"] 
        },
        {
            "condition" : "c1: denied_principal is not public:all", 
            "attribute_path" : ["rules", 0, "deny_rule", 0,"denied_principals"], 
            "values" : [["principalSet://goog/public:all"]], 
            "policy_type" : "whitelist" 
        },
    ],
    [
        { 
            "situation_description" : "public principals in denied_principals should have all permissions denied", 
            "remedies": ["This resource should deny all public access"] 
        },
        {
            "condition" : "c1: IF denied_principal = principalSet", 
            "attribute_path" : ["rules", 0, "deny_rule", 0,"denied_principals"], 
            "values" : [["principalSet://goog/public:all"]], 
            "policy_type" : "blacklist" 
        },
        {
            "condition" : "c2: IF denied_permissions != *", 
            "attribute_path" : ["rules", 0, "deny_rule", 0,"denied_permissions"], 
            "values" : [["*"]], 
            "policy_type" : "whitelist" 
        },
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
