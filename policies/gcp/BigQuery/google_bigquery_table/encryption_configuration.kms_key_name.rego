package terraform.gcp.security.BigQuery.google_bigquery_table.encryption_configuration_kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_table.vars

conditions := [
    [
        {"situation_description" : "Check for valid kms_key_name",
         "remedies": ["Add valid kms_key_name"]},
        {
            "condition": "Check for valid_kms_key_name",
            "attribute_path": ["encryption_configuration", "kms_key_name"],
            "values" : ["valid_kms_key_name"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
