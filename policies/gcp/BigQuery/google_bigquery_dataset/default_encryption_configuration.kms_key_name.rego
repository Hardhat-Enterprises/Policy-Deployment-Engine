package terraform.gcp.security.BigQuery.google_bigquery_dataset.default_encryption_configuration_kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

conditions := [
    [
        {"situation_description" : "The dataset has no customer-managed KMS key for default encryption, so new tables fall back to Google-managed keys that the organisation cannot rotate or revoke itself.",
         "remedies": ["Set kms_key_name to a customer-managed Cloud KMS key in the dataset's own region, in the form projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY", "Grant the BigQuery service account the Encrypter/Decrypter role on that key, or table creation will fail"]},
        {
            "condition": "Check if any for valid key name",
            "attribute_path" : ["default_encryption_configuration", "kms_key_name"],
            "values" : ["google_kms_crypto_key.crypto_key.id"],
            "policy_type" : "whitelist"  
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
