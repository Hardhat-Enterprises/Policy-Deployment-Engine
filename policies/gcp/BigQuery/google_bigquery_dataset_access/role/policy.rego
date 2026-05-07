package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.role
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "Incorrect role",
         "remedies": ["Change to OWNER"]},
        {
            "condition": "Check for correct role",
            "attribute_path" : ["role"],
            "values" : ["OWNER"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details