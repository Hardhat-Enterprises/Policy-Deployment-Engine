package terraform.gcp.security.bigquery.google_bigquery_connection.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
                {"situation_description": "kms_key_name is not set, leaving BigQuery Connection data encrypted only with Google-managed keys rather than a customer-managed key", "remedies": ["Set kms_key_name to a Cloud KMS key in the form projects/*/locations/*/keyRings/*/cryptoKeys/*"]},
        {
            "condition": "Check if kms_key_name is missing or empty",
            "attribute_path": ["kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
