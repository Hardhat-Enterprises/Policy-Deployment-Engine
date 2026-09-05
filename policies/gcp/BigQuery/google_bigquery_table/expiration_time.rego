package terraform.gcp.security.bigquery.google_bigquery_table.expiration_time
import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid expiration_time",
         "remedies": ["Add valid expiration_time"]},
        {
            "condition": "Check for valid_expiration_time",
            "attribute_path": ["expiration_time"],
            "values" : [1625097600000],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details