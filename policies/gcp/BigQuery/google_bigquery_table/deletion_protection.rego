package terraform.gcp.security.BigQuery.google_bigquery_table.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid deletion_protection",
         "remedies": ["Add valid deletion_protection"]},
        {
            "condition": "Check for valid_deletion_protection",
            "attribute_path": ["deletion_protection"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details