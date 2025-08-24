package terraform.gcp.security.deploy.custom_target_type_iam_policy.members
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.custom_target_type_iam_policy.vars

conditions := [
    [
    {"situation_description" : "Resource uses overly permissive IAM members which grants excessive access",
    "remedies":[ "Replace 'allUsers' and 'allAuthenticatedUsers' with specific user, service account, or group identities", "Remove wildcard domains and external email addresses", "Use principle of least privilege for member assignments"]},
    {
        "condition": "Check if policy data contains problematic members",
        "attribute_path" : ["policy_data"],
        "values" : ["{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\",\"allUsers\",\"domain:*\",\"user:external@gmail.com\"],\"role\":\"roles/viewer\"}]}"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details