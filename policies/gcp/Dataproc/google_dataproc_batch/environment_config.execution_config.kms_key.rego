package terraform.gcp.security.dataproc.google_dataproc_batch.environment_config_execution_config_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch is not encrypted with a customer-managed key held in an approved region.",
            "remedies": [
                "Set kms_key to a customer-managed Cloud KMS key of the form projects/<project>/locations/<region>/keyRings/<ring>/cryptoKeys/<key>, held in an approved region."
            ]
        },
        {
            "condition": "The KMS key must be a customer-managed key in an approved region.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "kms_key"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [["test-project"], ["australia-southeast1", "australia-southeast2"], ["test-ring"], ["test-key"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
