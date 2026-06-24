package terraform.gcp.security.developer_connect.google_developer_connect_git_repository_link.clone_uri
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_git_repository_link.vars

conditions := [
    [
    {"situation_description" : "Clone URI must be the approved repository",
    "remedies":[ "Use https://github.com/myorg/myrepo.git"]},
    {
        "condition": "Clone URI is not the approved repository",
        "attribute_path" : ["clone_uri"],
        "values" : ["https://github.com/myorg/myrepo.git"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
