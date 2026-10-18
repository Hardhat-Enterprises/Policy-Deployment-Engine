package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_source_image_encryption_key_kms_key_self_link

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The disk's source image encryption key reference is not a Cloud KMS key path. When a source image is encrypted, the key used to decrypt it should be a customer-managed Cloud KMS key so the organization controls access to it and can revoke it.",
            "remedies": [
                "Set disk.source_image_encryption_key.kms_key_self_link to a Cloud KMS key path (projects/<project>/locations/<location>/keyRings/<ring>/cryptoKeys/<key>).",
                "Leave source_image_encryption_key unset when the source image is not encrypted."
            ]
        },
        {
            "condition": "Check that disk.source_image_encryption_key.kms_key_self_link is a Cloud KMS key path",
            "attribute_path": ["disk", 0, "source_image_encryption_key", 0, "kms_key_self_link"],
            "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details