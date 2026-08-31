package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.domain
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "Incorrect domain",
         "remedies": ["Change to valid domain"]},
        {
            "condition": "Check for correct domain",
            "attribute_path" : ["domain"],
            "values" : ["valid.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details