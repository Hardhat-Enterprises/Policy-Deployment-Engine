package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.group_by_email
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "Incorrect group_by_email",
         "remedies": ["Change to valid email"]},
        {
            "condition": "Check for correct group_by_email",
            "attribute_path" : ["group_by_email"],
            "values" : ["*@*", [["user"], ["example.com"]]],
            "policy_type" : "pattern whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details