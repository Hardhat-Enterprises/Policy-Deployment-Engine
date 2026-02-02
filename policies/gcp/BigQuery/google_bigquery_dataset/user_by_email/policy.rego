package terraform.gcp.security.BigQuery.google_bigquery_dataset.user_by_email
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "Incorrect Email",
         "remedies": ["Change to valid email address"]},
        {
            "condition": "Check if any access entry has invalid user email",
            "attribute_path" : ["access", "user_by_email"],
            "values" : ["admin@example.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details