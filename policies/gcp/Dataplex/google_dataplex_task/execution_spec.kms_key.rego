package terraform.gcp.security.dataplex.google_dataplex_task.execution_spec_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_task.vars

conditions  := [
    [
        {
            "situation_description": "Task does not have Customer-Managed Encryption Keys (CMEK) configured - use Google-managed keys only",
            "remedies": [
                "Set execution_spec.kms_key to a customer-managed Key Management Service (KMS) key",
                "Example format: projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY"
            ]
        },
        {
            "condition": "execution_spec kms_key must be set",
            "attribute_path": ["execution_spec", 0, "kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details