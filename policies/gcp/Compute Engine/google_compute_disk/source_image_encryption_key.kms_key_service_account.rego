package terraform.gcp.security.compute_engine.google_compute_disk.source_image_encryption_key.kms_key_service_account
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk uses the default Compute Engine service agent for source image KMS operations rather than a dedicated service account.",
            "remedies": ["Set source_image_encryption_key.kms_key_service_account to a dedicated service account with least-privilege KMS access."]
        },
        {
            "condition": "source_image_encryption_key.kms_key_service_account must be set.",
            "attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
