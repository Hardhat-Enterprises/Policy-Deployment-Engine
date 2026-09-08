package terraform.gcp.security.compute_engine.google_compute_region_disk.source_image_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "An explicit service account should be configured for source image KMS encryption requests instead of relying on the default service agent.",
            "remedies": [
                "Set source_image_encryption_key.kms_key_service_account to a non-empty service account identity."
            ]
        },
        {
            "condition": "source_image_encryption_key.kms_key_service_account must be explicitly configured.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details