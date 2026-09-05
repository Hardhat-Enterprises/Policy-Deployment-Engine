package terraform.gcp.security.bigquery.google_bigquery_row_access_policy.table_id
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_row_access_policy.vars

conditions := [
    [
        {"situation_description" : "Check for valid table_id",
         "remedies": ["Add valid table_id"]},
        {
            "condition": "Check for valid_table_id",
            "attribute_path": ["table_id"],
            "values" : ["my_table"],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details