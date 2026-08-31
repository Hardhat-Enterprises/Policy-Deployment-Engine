package terraform.gcp.security.BigQuery.google_bigquery_dataset.location
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "Incorrect location",
         "remedies": ["Change to australia-southeast1"]},
        {
            "condition": "Check if any is set to australia-southeast1",
            "attribute_path" : ["location"],
            "values" : ["australia-southeast1"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details