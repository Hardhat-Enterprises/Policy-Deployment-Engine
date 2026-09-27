package terraform.gcp.security.compute_engine.google_compute_region_disk.source_image_encryption_key_rsa_encrypted_key

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "An RSA-encrypted source image key is defined directly in Terraform.",
            "remedies": [
                "Remove the RSA-encrypted key from the Terraform configuration and use Cloud KMS to manage the encryption key."
            ]
        },
        {
            "condition": "RSA-encrypted source image key material should not be defined directly.",
            "attribute_path": ["source_image_encryption_key", 0, "rsa_encrypted_key"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details