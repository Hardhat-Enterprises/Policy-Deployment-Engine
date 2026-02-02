package terraform.gcp.security.BigQuery.google_bigquery_job.location
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid location",
         "remedies": ["Add valid location"]},
        {
            "condition": "Check for valid_location",
            "attribute_path": ["location"],
            "values" : ["australia-southeast1"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details