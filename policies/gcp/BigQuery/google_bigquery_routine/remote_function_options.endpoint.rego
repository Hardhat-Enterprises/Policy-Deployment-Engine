package terraform.gcp.security.bigquery.google_bigquery_routine.remote_function_options_endpoint
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_routine.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
