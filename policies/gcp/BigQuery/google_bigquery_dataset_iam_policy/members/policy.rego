package terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.members
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset_iam_policy.vars

conditions := [
    [
        {"situation_description" : "allUsers detected",
         "remedies": ["Remove access from allUsers"]},
        {
            "condition": "Check for iam_member containing allUsers",
            "attribute_path" : ["policy_data"],
            "values" : "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/bigquery.dataViewer\"}]}", 
            "policy_type" : "Blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details