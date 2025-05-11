package terraform.gcp.security.iam.projects_policy_binding.target 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "unapproved target.principal_set", 
            "remedies": [
                "Currently 'target.principal_set' should be supported!"
            ]
        },
        {
            "condition" : "c1: no supported target.principal_set root",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//*[.]googleapis[.]com", [["cloudresourcemanager", "iam"]]],
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        { 
            "situation_description" : "unapproved target.principal_set cloudresourcemanager project id/num", 
            "remedies": [
                "Currently 'target.principal_set cloudresourcemanager should contain approved project id/num!"
            ]
        },
        {
            "condition" : "c1: target.principal_set root is 'cloudresourcemanager'",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//*[.]googleapis.com", [["cloudresourcemanager"]]],
            "policy_type" : "pattern blacklist"
        },
        {
            "condition" : "c2: unapproved project id/num.",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//cloudresourcemanager[.]googleapis[.]com/projects/*", [["project-id-1", "project-num-1"]]],
            "policy_type" : "pattern whitelist"
        }
    ],
    [
        { 
            "situation_description" : "unapproved target.principal_set iam identities", 
            "remedies": [
                "Currently 'target.principal_set iam identities' has unapproved values!"
            ]
        },
        {
            "condition" : "c1: target.principal_set root is 'iam'",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//*[.]googleapis.com", [["iam"]]],
            "policy_type" : "pattern blacklist"
        },
        {
            "condition" : "c2: unapproved project id, location, and workloadIdentityPool_id",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//iam[.]googleapis[.]com/projects/*/locations/*/workloadIdentityPools/*", [["project-id-1", "project-id-2"], ["location-1", "location-2"], ["wip_id-1", "wip_id-2"]]],
            "policy_type" : "pattern whitelist"
        }
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

