package terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_data_policy.google_bigquery_datapolicy_data_policy.vars

conditions := [
    [
    {"situation_description" : "Ensure location is provided",
    "remedies":["Set location to Australia"]},
    {
        "condition": "Validating location",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1-a, australia-southeast1-b, australia-southeast1-c, australia-southeast2-a, australia-southeast2-b, australia-southeast2-"], 
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details