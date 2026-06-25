package terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_member.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details