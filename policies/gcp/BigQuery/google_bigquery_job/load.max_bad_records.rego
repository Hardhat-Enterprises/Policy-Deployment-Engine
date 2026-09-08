package terraform.gcp.security.bigquery.google_bigquery_job.load_max_bad_records
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid max_bad_records",
         "remedies": ["Add valid max_bad_records"]},
        {
            "condition": "Check for valid_max_bad_records",
            "attribute_path": ["load", 0, "max_bad_records"],
            "values" : 10,
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
