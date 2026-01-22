package terraform.gcp.security.developer_connect.google_developer_connect_account_connector.system_provider_id
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_account_connector.vars

conditions := [
    [
    {"situation_description" : "Only approved providers are allowed",
    "remedies":[ "Use GITHUB or GITLAB"]},
    {
        "condition": "Provider is not approved",
        "attribute_path" : ["provider_oauth_config", 0, "system_provider_id"],
        "values" : ["GITHUB","GITLAB"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details