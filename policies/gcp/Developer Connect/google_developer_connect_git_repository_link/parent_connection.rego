package terraform.gcp.security.developer_connect.google_developer_connect_git_repository_link.parent_connection
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_git_repository_link.vars

conditions := [
    [
    {"situation_description" : "Git repository must use an approved parent connection",
    "remedies":[ "Set parent_connection to my-connection.connection_id"]},
    {
        "condition": "Parent connection is not approved",
        "attribute_path" : ["parent_connection"],
        "values" : ["my-connection.connection_id"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
