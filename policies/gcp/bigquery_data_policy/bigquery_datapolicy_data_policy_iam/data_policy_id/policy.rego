package terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.data_policy_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.bigquery_datapolicy_data_policy_iam.vars

conditions := [
    [
    {"situation_description" : "Ensure data_policy_id is provided",
    "remedies":["Set data_policy_id to data_policy"]},
    {
        "condition": "Validating data_policy_id",
        "attribute_path" : ["data_policy_id"],
        "values" : ["data_policy"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details