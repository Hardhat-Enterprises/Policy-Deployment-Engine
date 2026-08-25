package terraform.gcp.security.compute_engine.google_compute_image.image_encryption_key_kms_key_service_account

import data.terraform.helpers

import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image does not explicitly specify a service account for Cloud KMS encryption operations.",
            "remedies": [
                "Set image_encryption_key.kms_key_service_account to an appropriate service account authorised to use the configured Cloud KMS key."
            ]
        },
        {
            "condition": "A service account must be explicitly specified when using a Cloud KMS key for image encryption.",
            "attribute_path": ["image_encryption_key", 0, "kms_key_service_account"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details