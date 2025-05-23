package terraform.gcp.security.iam.principal_access_boundary_policy.enforcement_version
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.principal_access_boundary_policy.vars

scenarios_list:= [
    [
        { 
            "situation_description" : "enforcement_version should be latest", 
            "remedies": [
                "enforcement_version should be set to 'latest' or not set at all"
            ]
        },
        {
            "condition" : "c1: enforcement_version should be latest",
            "attribute_path" : ["details", 0, "enforcement_version"], 
            "values" : ["latest", null],
            "policy_type" : "whitelist"
        }
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

