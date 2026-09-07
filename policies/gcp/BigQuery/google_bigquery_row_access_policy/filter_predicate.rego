package terraform.gcp.security.BigQuery.google_bigquery_row_access_policy.filter_predicate
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_row_access_policy.vars

conditions := [
    [
        {"situation_description" : "Check for valid filter_predicate",
         "remedies": ["Add valid filter_predicate"]},
        {
            "condition": "Check for valid_filter_predicate",
            "attribute_path": ["filter_predicate"],
            "values" : "region='australia-southeast1'", 
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details