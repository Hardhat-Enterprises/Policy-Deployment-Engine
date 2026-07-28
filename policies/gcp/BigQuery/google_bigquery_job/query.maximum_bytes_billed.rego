package terraform.gcp.security.BigQuery.google_bigquery_job.query_maximum_bytes_billed
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid maximum_bytes_billed",
         "remedies": ["Add valid maximum_bytes_billed"]},
        {
            "condition": "Check for valid_maximum_bytes_billed",
            "attribute_path": ["query", 0, "maximum_bytes_billed"],
            "values" : null,
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
