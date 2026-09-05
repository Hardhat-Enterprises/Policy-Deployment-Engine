package terraform.gcp.security.compute_engine.google_compute_disk.disk_encryption_key.kms_key_service_account
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk uses the default Compute Engine service agent for KMS encryption operations rather than a dedicated least-privilege service account.",
            "remedies": ["Set disk_encryption_key.kms_key_service_account to a dedicated service account with least-privilege KMS access."]
        },
        {
            "condition": "disk_encryption_key.kms_key_service_account must be set.",
            "attribute_path": ["disk_encryption_key", 0, "kms_key_service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
