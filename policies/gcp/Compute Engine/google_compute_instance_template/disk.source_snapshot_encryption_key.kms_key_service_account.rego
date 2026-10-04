package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_source_snapshot_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "A disk's source snapshot encryption key does not access its KMS key through a dedicated service account. When kms_key_service_account is left out of a configured source_snapshot_encryption_key block, the default Compute Engine service account (PROJECT_NUMBER-compute@developer.gserviceaccount.com) is used, which is broadly privileged, so relying on it for key access is an over-privilege risk compared with a dedicated least-privilege service account. Disks without an encrypted source snapshot are not affected.",
            "match": "any",
            "remedies": [
                "Set disk.source_snapshot_encryption_key.kms_key_service_account to a dedicated user-managed service account (an address ending in .iam.gserviceaccount.com) on every disk that has a source_snapshot_encryption_key block.",
                "Grant that service account only the Cloud KMS CryptoKey Encrypter/Decrypter role on the specific key."
            ]
        },
        {
            "condition": "Check that every configured source_snapshot_encryption_key sets kms_key_service_account",
            "attribute_path": ["disk", "source_snapshot_encryption_key", "kms_key_service_account"],
            "values": ["set"],
            "policy_type": "presence"
        },
        {
            "condition": "Check that disk.source_snapshot_encryption_key.kms_key_service_account is a user-managed service account",
            "attribute_path": ["disk", 0, "source_snapshot_encryption_key", 0, "kms_key_service_account"],
            "values": ["*@*.iam.gserviceaccount.com"],
            "policy_type": "element pattern whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
