package terraform.gcp.security.iam.principal_access_boundary_policy.resources
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.principal_access_boundary_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "unapproved resource access", 
            "remedies": [
                "Only approved resources are allowed to be given access to!"
            ]
        },
        {
            "condition" : "c1: unapproved resource (folder) access",
            "attribute_path" : ["details", 0, "rules", 0, "resources"], 
            "values" : [["//cloudresourcemanager.googleapis.com/folders/folder-id-1"]],
            "policy_type" : "whitelist"
        }
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

