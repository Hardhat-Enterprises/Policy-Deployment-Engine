package terraform.gcp.security.deploy.target_iam_member.prohibited_member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target_iam_member.vars

conditions := [
    [
    {"situation_description" : "IAM Member allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers from members list",]},
    {
        "condition": "Cloud Deploy Target IAM member should not contain overly permissive members",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
