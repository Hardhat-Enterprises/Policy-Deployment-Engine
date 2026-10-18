package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_disk_encryption_key_kms_key_self_link

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's boot disk is not encrypted with a customer-managed encryption key (CMEK), or the key reference is not a valid Cloud KMS key path. Without a CMEK the organization cannot control, rotate or revoke the key that protects the disk data.",
            "match": "any",
            "remedies": [
                "Add a disk.disk_encryption_key block with kms_key_self_link set to a Cloud KMS key managed by the organization (projects/<project>/locations/<location>/keyRings/<ring>/cryptoKeys/<key>).",
                "Grant the disk's KMS service account only the CryptoKey Encrypter/Decrypter role on that key."
            ]
        },
        {
            "condition": "Check that disk.disk_encryption_key.kms_key_self_link is set",
            "attribute_path": ["disk", 0, "disk_encryption_key", 0, "kms_key_self_link"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
        {
            "condition": "Check that disk.disk_encryption_key.kms_key_self_link is a Cloud KMS key path",
            "attribute_path": ["disk", 0, "disk_encryption_key", 0, "kms_key_self_link"],
            "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
