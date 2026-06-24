package terraform.gcp.security.BigQuery.google_bigquery_table.external_data_configuration_connection_id
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid connection_id",
         "remedies": ["Add valid connection_id"]},
        {
            "condition": "Check for valid_connection_id",
            "attribute_path": ["external_data_configuration", "connection_id"],
            "values" : ["valid_connection_id"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
