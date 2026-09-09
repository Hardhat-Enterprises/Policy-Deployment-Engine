package terraform.gcp.security.dataproc.google_dataproc_batch.environment_config_execution_config_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch is not encrypted with a customer-managed Cloud KMS key held in an approved region.",
            "remedies": [
                "Set kms_key to a customer-managed key of the form projects/*/locations/*/keyRings/*/cryptoKeys/*, held in an approved region."
            ]
        },
        {
            "condition": "A customer-managed Cloud KMS key must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
        {
            "condition": "The key must be held in an approved region.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "kms_key"],
            "values": [
                "/locations/*/keyRings/",
                [["australia-southeast1", "australia-southeast2"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
