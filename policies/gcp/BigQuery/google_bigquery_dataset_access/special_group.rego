package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.special_group
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "Incorrect special_group",
         "remedies": ["Change to correct special_group"]},
        {
            "condition": "Check for correct special_group",
            "attribute_path" : ["special_group"],
            "values" : ["projectOwners"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details