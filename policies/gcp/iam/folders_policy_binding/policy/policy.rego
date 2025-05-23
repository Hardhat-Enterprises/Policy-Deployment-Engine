package terraform.gcp.security.iam.folders_policy_binding.policy 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.folders_policy_binding.vars

org_ids = ["org-c", "org-nc"]

scenarios_list:= [
    [
        { 
            "situation_description" : "unapproved policy-id from an organization's (org-c) policy dir", 
            "remedies": [
                "Please check that policy-id is approved!"
            ] 
        },
        {
            "condition" : "c1: IF this organization = org-c", 
            "attribute_path" : ["policy"], 
            "values" : ["organizations/*/", [["org-c"]]],
            "policy_type" : "pattern blacklist" 
        },
        {
            "condition" : "c2: THEN check target policy",
            "attribute_path" : ["policy"], 
            "values" : ["organizations/org-c/locations/global/principalAccessBoundaryPolicies/*", [["principal_access_boundary_policy_id", "principal_access_boundary_policy_id-2"]]],
            "policy_type" : "pattern whitelist" 
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

