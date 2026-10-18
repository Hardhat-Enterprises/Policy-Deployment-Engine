package terraform.gcp.security.deploy.google_clouddeploy_target_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_target_iam_binding.vars

conditions := [
    [
    {"situation_description" : "IAM binding allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers from members list",]},
    {
        "condition": "Cloud Deploy Target IAM binding should not contain overly permissive members",
        "attribute_path" : ["members"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
