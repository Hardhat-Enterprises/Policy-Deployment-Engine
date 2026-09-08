package terraform.gcp.security.compute_engine.google_compute_region_disk.source_image_encryption_key_kms_key_service_account

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "A valid service account should be used for source image KMS encryption requests.",
            "remedies": [
                "Configure source_image_encryption_key.kms_key_service_account using a valid Google service account email."
            ]
        },
        {
            "condition": "source_image_encryption_key.kms_key_service_account must be configured.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
            "values": [""],
            "policy_type": "blacklist"
        },
        {
            "condition": "source_image_encryption_key.kms_key_service_account must use a valid service account email format.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
            "values": ["^[a-z][a-z0-9-]*@[a-z][a-z0-9-]*[.]iam[.]gserviceaccount[.]com$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details