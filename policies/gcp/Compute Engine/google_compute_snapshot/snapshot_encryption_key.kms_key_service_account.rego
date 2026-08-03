package terraform.gcp.security.compute_engine.google_compute_snapshot.snapshot_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "No service account is set for the encryption request",
            "remedies": ["Set kms_key_service_account to a dedicated service account that is authorised to use the KMS key"]
        },
        {
            "condition": "kms_key_service_account is set",
            "attribute_path": ["snapshot_encryption_key", 0, "kms_key_service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details