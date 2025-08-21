package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.vars

conditions := [
    [
    {"situation_description" : "Ensure location is provided",
    "remedies":["Set location to australia-southeast1-a"]},
    {
        "condition": "Validating location",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1-a"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details