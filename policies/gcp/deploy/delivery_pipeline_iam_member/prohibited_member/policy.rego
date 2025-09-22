package terraform.gcp.security.deploy.delivery_pipeline_iam_member.prohibited_member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline_iam_member.vars

conditions := [
    [
    {"situation_description" : "IAM member allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers", "Use specific user accounts, service accounts, or groups instead", "Apply principle of least privilege"]},
    {
        "condition": "Check if member contains overly permissive identities",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details