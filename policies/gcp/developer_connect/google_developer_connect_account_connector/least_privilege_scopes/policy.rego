package terraform.gcp.security.developer_connect.google_developer_connect_account_connector.least_privilege_scopes
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_account_connector.vars

conditions := [
    [
    {"situation_description" : "Scopes must be least-privilege (only repo allowed)",
    "remedies":["Use only the repo scope"]
    },
    {
        "condition": "Scope is not allowed",
        "attribute_path" : ["provider_oauth_config", 0, "scopes", 0],
        "values" : ["repo"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details