package terraform.gcp.security.BigQuery.google_bigquery_table.max_staleness 
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid max_staleness",
         "remedies": ["Add valid max_staleness"]},
        {
            "condition": "Check for valid_max_staleness",
            "attribute_path": ["max_staleness"],
            "values" : ["0"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details