package terraform.gcp.security.BigQuery.google_bigquery_table_iam.role
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table_iam.vars

conditions := [
    [
        {"situation_description" : "Check for valid role",
         "remedies": ["Add valid role"]},
        {
            "condition": "Check for valid_role",
            "attribute_path": ["policy_data"],
            "values" : ["{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/bigquery.dataOwner\"}]}"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details