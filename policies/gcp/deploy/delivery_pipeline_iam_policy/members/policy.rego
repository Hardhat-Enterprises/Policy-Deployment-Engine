package terraform.gcp.security.deploy.delivery_pipeline_iam_policy.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline_iam_policy.vars

conditions := [
    [
    {"situation_description" : "IAM policy allows overly permissive access with allUsers or allAuthenticatedUsers",
    "remedies":[ "Remove allUsers and allAuthenticatedUsers from policy bindings", "Use specific user accounts, service accounts, or groups instead", "Apply principle of least privilege"]},
    {
        "condition": "Check if policy_data contains overly permissive identities in bindings",
        "attribute_path" : ["policy_data"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
