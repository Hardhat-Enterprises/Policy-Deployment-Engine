package terraform.gcp.security.BigQuery.google_bigquery_job.key
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid key",
         "remedies": ["Add valid key"]},
        {
            "condition": "Check for valid_key",
            "attribute_path": ["query", 0, "connection_properties", 0, "key"],
            "values" : "valid_key", 
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details