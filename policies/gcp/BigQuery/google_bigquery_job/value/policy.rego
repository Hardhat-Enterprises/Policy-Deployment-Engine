package terraform.gcp.security.BigQuery.google_bigquery_job.value
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_job.vars

conditions := [
    [
        {"situation_description" : "Check for valid value",
         "remedies": ["Add valid value"]},
        {
            "condition": "Check for valid_value",
            "attribute_path": ["query", 0, "connection_properties", 0, "value"],
            "values" : "valid_value", 
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details