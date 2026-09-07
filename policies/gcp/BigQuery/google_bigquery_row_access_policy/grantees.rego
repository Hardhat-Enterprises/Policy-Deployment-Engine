package terraform.gcp.security.bigquery.google_bigquery_row_access_policy.grantees
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_row_access_policy.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details