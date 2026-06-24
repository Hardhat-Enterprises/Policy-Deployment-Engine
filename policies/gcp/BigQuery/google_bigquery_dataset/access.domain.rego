package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_domain
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "Incorrect domain",
         "remedies": ["Change to example.com"]},
        {
            "condition": "Check if any is set to example.com",
            "attribute_path" : ["access", "domain"],
            "values" : ["example.com"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
