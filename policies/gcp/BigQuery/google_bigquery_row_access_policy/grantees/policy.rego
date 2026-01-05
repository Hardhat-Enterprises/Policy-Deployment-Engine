package terraform.gcp.security.BigQuery.google_bigquery_row_access_policy.grantees
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_row_access_policy.vars

conditions := [
    [
        {"situation_description" : "Check for valid grantees",
         "remedies": ["Add valid grantees"]},
        {
            "condition": "Check for valid_grantees",
            "attribute_path": ["grantees"],
            "values" : ["valid_user"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details