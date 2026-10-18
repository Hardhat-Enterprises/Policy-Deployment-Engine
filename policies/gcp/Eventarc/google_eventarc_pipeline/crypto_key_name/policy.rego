package terraform.gcp.security.eventarc.google_eventarc_pipeline.crypto_key_name

import data.terraform.helpers
import data.terraform.gcp.security.eventarc.google_eventarc_pipeline.vars

conditions := [
    [
        {"situation_description" : "crypto_key_name is not set, leaving Pipeline event data encrypted only with an internal Google-owned key rather than a customer-managed key",
        "remedies":[ "Set crypto_key_name to a Cloud KMS key in the form projects/*/locations/*/keyRings/*/cryptoKeys/*"]},
        {
            "condition": "Check if crypto_key_name is missing or empty",
            "attribute_path" : ["crypto_key_name"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
