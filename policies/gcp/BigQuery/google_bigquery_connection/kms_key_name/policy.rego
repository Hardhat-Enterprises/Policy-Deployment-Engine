package terraform.gcp.security.BigQuery.google_bigquery_connection.kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

conditions := [
    [
        {"situation_description": "kms_key_name is not set, leaving BigQuery Connection data unencrypted at rest", "remedies": ["Set kms_key_name to a valid Cloud KMS key"]},
        {
            "condition": "Check if kms_key_name is configured",
            "attribute_path": ["kms_key_name"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details