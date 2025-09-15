package terraform.gcp.security.deploy.target_iam_policy.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target_iam_policy.vars

conditions := [
    [
    {"situation_description" : "IAM Policy allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers from members list",]},
    {
        "condition": "Cloud Deploy Target IAM policy should not contain overly permissive members",
        "attribute_path" : ["policy_data"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
