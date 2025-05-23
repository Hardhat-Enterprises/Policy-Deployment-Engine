package terraform.gcp.security.iam.access_boundary_policy.available_resource 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "* in resources applies to all", 
            "remedies": ["available_resources should not use * as a value!"] 
        },
        {
            "condition": "c1: * in resources applies to all",
            "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
            "values": ["*"],
            "policy_type": "blacklist"
        },
    ],
    [
        { 
            "situation_description" : "unapproved resource", 
            "remedies": ["available_resources should take on an approved resource value"] 
        },
        {
            "condition": "c1: unapproved resource",
            "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
            "values": ["*", "apigee.googleapis.com/ApiProduct"],
            "policy_type": "whitelist"
        },
    ],

]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

detail := summary.details
