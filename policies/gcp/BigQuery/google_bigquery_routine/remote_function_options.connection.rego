package terraform.gcp.security.BigQuery.google_bigquery_routine.remote_function_options_connection
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {"situation_description" : "Check for valid connections",
         "remedies": ["Add valid connections"]},
        {
            "condition": "Check for valid_connection",
            "attribute_path": ["remote_function_options", "connection"],
            "values" : ["google_bigquery_connection.test.name"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
