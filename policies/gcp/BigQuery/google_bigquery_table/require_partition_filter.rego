package terraform.gcp.security.BigQuery.google_bigquery_table.require_partition_filter
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid require_partition_filter",
         "remedies": ["Add valid require_partition_filter"]},
        {
            "condition": "Check for valid_require_partition_filter",
            "attribute_path": ["require_partition_filter"],
            "values" : [false],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details