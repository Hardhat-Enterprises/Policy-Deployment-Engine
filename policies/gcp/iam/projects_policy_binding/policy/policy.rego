package terraform.gcp.security.iam.projects_policy_binding.policy 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

# CUSTOM VALUES
org_ids = ["org-c", "org-nc"]

scenarios_list:= [
    
    [
        { 
            "situation_description" : "unapproved policy organization", 
            "remedies": [
                "Please check that the root organzation dir is approved!"
            ] 
        },
        {
            "condition" : "c1: unapproved policy organization", 
            "attribute_path" : ["policy"], 
            "values" : ["organizations/*/", [["org-c"]]],
            "policy_type" : "pattern whitelist" 
        },
    ],
    [
        { 
            "situation_description" : "unapproved policy-id from an organization's (org-c) policy dir", 
            "remedies": [
                "Please check that policy-id is approved!"
            ] 
        },
        {
            "condition" : "c1: this organization", # for this organization only
            "attribute_path" : ["policy"], 
            "values" : ["organizations/*/", [["org-c"]]],
            "policy_type" : "pattern blacklist" 
        },
        {
            "condition" : "c2: unapproved policy id",
            "attribute_path" : ["policy"], 
            "values" : ["organizations/org-c/*/*/*/*", [["locations"], ["global"], ["principalAccessBoundaryPolicies"], ["principal_access_boundary_policy_id"]]],
            "policy_type" : "pattern whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

