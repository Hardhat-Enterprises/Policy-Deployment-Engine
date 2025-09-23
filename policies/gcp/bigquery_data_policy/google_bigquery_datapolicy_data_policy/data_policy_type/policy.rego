package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.data_policy_type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.vars

conditions := [
    [
    {"situation_description" : "Ensure data policy type is correct",
    "remedies":["Set data_policy_type to COLUMN_LEVEL_SECURITY_POLICY"]},
    {
        "condition": "Validating data_policy_type",
        "attribute_path" : ["data_policy_type"],
        "values" : ["COLUMN_LEVEL_SECURITY_POLICY"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details