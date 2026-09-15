package terraform.gcp.security.deploy.google_clouddeploy_custom_target_type_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_custom_target_type_iam_binding.vars

conditions := [
    [
    {"situation_description" : "IAM binding allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers from members list"]},
    {
        "condition": "Check if members contains overly permissive identities",
        "attribute_path" : ["members"],
        "values" : ["allUsers", "allAuthenticatedUsers",],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
