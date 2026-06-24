package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_group_by_email
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "Incorrect Email",
         "remedies": ["Change to valid email address"]},
        {
            "condition": "Check if any access entry has invalid group email",
            "attribute_path" : ["access", "group_by_email"],
            "values" : ["example@company.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
