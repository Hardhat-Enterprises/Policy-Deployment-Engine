package terraform.gcp.security.compute_engine.google_compute_region_instance_template.disk_disk_encryption_key_kms_key_service_account
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars
conditions := [
    [
        {
            "situation_description": "Regional instance template disk does not specify a dedicated service account for KMS encryption operations, falling back to the default Compute Engine service agent.",
            "remedies": ["Set disk_encryption_key.kms_key_service_account to a dedicated service account with least-privilege KMS access."]
        },
        {
            "condition": "disk_encryption_key.kms_key_service_account must be set.",
            "attribute_path": ["disk", 0, "disk_encryption_key", 0, "kms_key_service_account"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Regional instance template disk specifies a KMS service account that does not match the required GCP service account format.",
            "remedies": ["Set disk_encryption_key.kms_key_service_account to a valid GCP service account in the format name@project.iam.gserviceaccount.com."]
        },
        {
            "condition": "disk_encryption_key.kms_key_service_account must match a valid GCP service account format.",
            "attribute_path": ["disk", 0, "disk_encryption_key", 0, "kms_key_service_account"],
            "values": [".+@.+\\.iam\\.gserviceaccount\\.com"],
            "policy_type": "pattern whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details