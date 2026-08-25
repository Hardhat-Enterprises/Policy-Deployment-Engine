package terraform.gcp.security.compute_engine.google_compute_disk.source_image_encryption_key_kms_key_self_link

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars

conditions := [
    [
        {
            "situation_description": "Compute disk references a CMEK-protected source image with an unapproved KMS key, breaking the customer-controlled encryption chain.",
            "remedies": ["Set source_image_encryption_key.kms_key_self_link to an approved KMS key from an approved project and region."]
        },
        {
            "condition": "source_image_encryption_key.kms_key_self_link must reference an approved CMEK key.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_self_link"],
            "values": ["projects/my-project/locations/australia-southeast1/keyRings/my-key-ring/cryptoKeys/my-key"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details