package terraform.gcp.security.iam.principal_access_boundary_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.principal_access_boundary_policy.vars

# CUSTOM VALUES
approved_access_resource_list = [
    "//cloudresourcemanager.googleapis.com/organizations/org-c", # org
    "//cloudresourcemanager.googleapis.com/folders/123", # folder
    "//cloudresourcemanager.googleapis.com/projects/my-project-id", # projects
    "//cloudresourcemanager.googleapis.com/folders/public"
]

scenarios_list:= [
    [
        { 
            "situation_description" : "unapproved resource access", 
            "remedies": [
                "Only approved resources are allowed to be given access to!"
            ]
        },
        {
            "condition" : "c1: unapproved resource access",
            "attribute_path" : ["details", 0, "rules", 0, "resources"], 
            "values" : approved_access_resource_list,
            "policy_type" : "whitelist"
        },        
        {
            "condition" : "c2: if effect is ALLOW",
            "attribute_path" : ["details", 0, "rules", 0, "effect"], 
            "values" : ["ALLOW"],
            "policy_type" : "blacklist"
        },
    ],
    [
        { 
            "situation_description" : "unapproved resource access for this org: org-c", 
            "remedies": [
                "Only approved resources are allowed to be given access to!"
            ]
        },
        {
            "condition" : "c1: unapproved resource",
            "attribute_path" : ["details", 0, "rules", 0, "resources"], 
            "values" : approved_access_resource_list,
            "policy_type" : "whitelist"
        },        
        {
            "condition" : "c2: if effect is ALLOW (access)",
            "attribute_path" : ["details", 0, "rules", 0, "effect"], 
            "values" : ["ALLOW"],
            "policy_type" : "blacklist"
        },
        {
            "condition" : "c3: this org",
            "attribute_path" : ["orgnaization"], 
            "values" : ["org-c"],
            "policy_type" : "blacklist"
        },
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

