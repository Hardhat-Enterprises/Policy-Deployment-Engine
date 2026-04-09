package terraform.gcp.security.developer_connect.google_developer_connect_account_connector.approved_locations
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_account_connector.vars

conditions := [
    [
    {"situation_description" : "Location must be within Australian regions",
    "remedies":[ "Set location to australia-southeast1 or australia-southeast2"]},
    {
        "condition": "Location not in approved Australian regions",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details