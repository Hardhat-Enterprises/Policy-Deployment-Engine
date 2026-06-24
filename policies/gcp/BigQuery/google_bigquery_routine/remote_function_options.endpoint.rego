package terraform.gcp.security.BigQuery.google_bigquery_routine.remote_function_options_endpoint
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_routine.vars

conditions := [
    [
        {"situation_description" : "Check for valid endpoint",
         "remedies": ["Add valid endpoint"]},
        {
            "condition": "Check for valid_endpoint",
            "attribute_path": ["remote_function_options", "endpoint"],
            "values" : ["https://australia-southeast1-my_gcf_project.cloudfunctions.net/remote_add"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
