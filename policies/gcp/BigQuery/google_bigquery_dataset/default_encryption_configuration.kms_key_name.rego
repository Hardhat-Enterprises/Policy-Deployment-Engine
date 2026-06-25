package terraform.gcp.security.BigQuery.google_bigquery_dataset.default_encryption_configuration_kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "Incorrect key",
         "remedies": ["Change to valid key name"]},
        {
            "condition": "Check if any for valid key name",
            "attribute_path" : ["default_encryption_configuration", "kms_key_name"],
            "values" : ["google_kms_crypto_key.crypto_key.id"],
            "policy_type" : "whitelist"  
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
