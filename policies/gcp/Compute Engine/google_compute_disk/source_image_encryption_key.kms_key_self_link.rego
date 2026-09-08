package terraform.gcp.security.compute_engine.google_compute_disk.source_image_encryption_key_kms_key_self_link
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk does not specify a CMEK key for the source image, breaking the customer-controlled encryption chain.",
            "remedies": ["Set source_image_encryption_key.kms_key_self_link to a valid KMS key to maintain customer-managed encryption throughout the disk lineage."]
        },
        {
            "condition": "source_image_encryption_key.kms_key_self_link must be set.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_self_link"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Compute disk specifies a source image KMS key that does not match the required KMS self-link format.",
            "remedies": ["Set source_image_encryption_key.kms_key_self_link to a valid KMS key in the format projects/PROJECT/locations/LOCATION/keyRings/RING/cryptoKeys/KEY."]
        },
        {
            "condition": "source_image_encryption_key.kms_key_self_link must match a valid KMS key self-link format.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_self_link"],
            "values": ["^projects/.+/locations/.+/keyRings/.+/cryptoKeys/.+"],
            "policy_type": "pattern whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details