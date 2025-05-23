package terraform.gcp.security.iam.projects_policy_binding.target 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "unapproved target.principal_set", 
            "remedies": [
                "target.principal_set should be from an approved project!"
            ]
        },
        {
            "condition" : "c1: unapproved target.principal_set",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//cloudresourcemanager.googleapis.com/projects/*", [["project-id-1"]]],
            "policy_type" : "pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details

