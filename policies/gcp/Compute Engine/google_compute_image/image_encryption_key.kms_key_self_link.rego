package terraform.gcp.security.compute_engine.google_compute_image.image_encryption_key_kms_key_self_link

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image is not protected using a Cloud KMS customer-managed encryption key.",
            "remedies": [
                "Set image_encryption_key.kms_key_self_link to a valid Cloud KMS key self-link."
            ]
        },
        {
            "condition": "A Cloud KMS key must be specified for image encryption.",
            "attribute_path": ["image_encryption_key", 0, "kms_key_self_link"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details