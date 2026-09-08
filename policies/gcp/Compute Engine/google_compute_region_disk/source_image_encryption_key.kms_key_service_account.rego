package terraform.gcp.security.compute_engine.google_compute_region_disk.source_image_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Source image KMS encryption should use the default Compute Engine Service Agent instead of a custom service account.",
            "remedies": [
                "Remove kms_key_service_account from source_image_encryption_key to use the default Compute Engine Service Agent."
            ]
        },
        {
            "condition": "A custom source image KMS service account should not be configured.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details