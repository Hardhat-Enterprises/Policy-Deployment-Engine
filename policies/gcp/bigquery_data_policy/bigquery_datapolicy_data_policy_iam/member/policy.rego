package terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.vars

conditions := [
    [
    {"situation_description" : "Ensure member is provided",
    "remedies":["Set member to allAuthenticatedUsers"]},
    {
        "condition": "Validating member",
        "attribute_path" : ["member"],
        "values" : ["allAuthenticatedUsers"], 
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details