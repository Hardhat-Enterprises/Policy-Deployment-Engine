package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.user_by_email
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "Incorrect user_by_email",
         "remedies": ["Change to valid email"]},
        {
            "condition": "Check for correct user_by_email",
            "attribute_path" : ["user_by_email"],
            "values" : ["user@example.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details