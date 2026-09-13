package terraform.gcp.security.bigquery.google_bigquery_job.location
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_job.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details