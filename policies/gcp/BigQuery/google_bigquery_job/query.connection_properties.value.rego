package terraform.gcp.security.bigquery.google_bigquery_job.query_connection_properties_value
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_job.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
