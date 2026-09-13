package terraform.gcp.security.bigquery.google_bigquery_dataset_access.special_group
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset_access.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details