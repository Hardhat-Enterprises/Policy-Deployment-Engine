package terraform.gcp.security.iam.organizations_policy_binding.target 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.organizations_policy_binding.vars

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
            "situation_description" : "unapproved target.principal_set iam identities", 
            "remedies": [
                "Currently 'target.principal_set iam identities' should be supported!"
            ]
        },
        {
            "condition" : "c1: target.principal_set root is 'iam'",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//*[.]googleapis.com", [["iam"]]],
            "policy_type" : "pattern blacklist"
        },
        {
            "condition" : "c2: no supported target.principal_set root",
            "attribute_path" : ["target", 0, "principal_set"], 
            "values" : ["//iam[.]googleapis[.]com/locations/global/*", [["workforcePools", "workspace"]]],
            "policy_type" : "pattern whitelist"
        }
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

