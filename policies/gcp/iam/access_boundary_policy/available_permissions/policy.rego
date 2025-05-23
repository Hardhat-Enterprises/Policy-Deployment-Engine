package terraform.gcp.security.iam.access_boundary_policy.available_permissions 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "not in approved list of conditions", 
            "remedies": ["available_permissions should use shorthand notation: inRole:roles/XXX"] 
        },
        {
            "condition" : "c1: not in approved list of conditions", 
            "attribute_path" : ["rules", 0, "access_boundary_rule", 0, "available_permissions"], 
            "values" : [["inRole:roles/storage.objectViewer"]], 
            "policy_type" : "whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
