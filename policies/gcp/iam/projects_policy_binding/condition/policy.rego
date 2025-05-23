package terraform.gcp.security.iam.projects_policy_binding.condition 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "empty condition", 
            "remedies": [
                "a condition must be present"
            ] 
        },
        {
            "condition" : "c1: empty condition", 
            "attribute_path" : ["condition", 0, "expression"], 
            "values" : [""],
            "policy_type" : "blacklist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details

