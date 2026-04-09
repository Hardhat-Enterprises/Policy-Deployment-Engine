package terraform.gcp.security.BigQuery.google_bigquery_dataset_access.iam_member
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_access.vars

conditions := [
    [
        {"situation_description" : "allUsers detected",
         "remedies": ["Remove access from allUsers"]},
        {
            "condition": "Check for correct iam_member",
            "attribute_path" : ["iam_member"],
            "values" : ["allUsers"],
            "policy_type" : "blacklist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details