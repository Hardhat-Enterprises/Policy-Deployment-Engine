package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.policy_tag
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.vars

conditions := [
    [
    {"situation_description" : "Ensure policy tag is provided",
    "remedies":["Set policy_tag to Big Query"]},
    {
        "condition": "Validating policy_tag",
        "attribute_path" : ["policy_tag"],
        "values" : ["Big Query"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details