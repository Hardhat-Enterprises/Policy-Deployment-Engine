package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_source_snapshot_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "A disk's source snapshot is encrypted with a Cloud KMS key, but kms_key_service_account is not set, so the default Compute Engine service account (PROJECT_NUMBER-compute@developer.gserviceaccount.com) is used to access the key. The default account is broadly privileged, so relying on it for key access is an over-privilege risk. Disks without a KMS-encrypted source snapshot are not affected.",
            "match": "all",
            "remedies": [
                "Set disk.source_snapshot_encryption_key.kms_key_service_account to a dedicated user-managed service account (an address ending in .iam.gserviceaccount.com) whenever kms_key_self_link is set.",
                "Grant that service account only the Cloud KMS CryptoKey Encrypter/Decrypter role on the specific key."
            ]
        },
        {
            "condition": "The source snapshot is encrypted with a Cloud KMS key (kms_key_self_link is set)",
            "attribute_path": ["disk", 0, "source_snapshot_encryption_key", 0, "kms_key_self_link"],
            "values": [null, ""],
            "policy_type": "whitelist"
        },
        {
            "condition": "kms_key_service_account is not set",
            "attribute_path": ["disk", 0, "source_snapshot_encryption_key", 0, "kms_key_service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "A disk's source snapshot encryption key accesses its KMS key through a service account that is not a dedicated user-managed account, such as the default Compute Engine service account. The default account is broadly privileged, so relying on it for key access is an over-privilege risk.",
            "remedies": [
                "Set disk.source_snapshot_encryption_key.kms_key_service_account to a dedicated user-managed service account (an address ending in .iam.gserviceaccount.com).",
                "Grant that service account only the Cloud KMS CryptoKey Encrypter/Decrypter role on the specific key."
            ]
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
