package terraform.gcp.security.compute_engine.google_compute_region_disk.disk_encryption_key_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Regional disks should use a valid Customer-Managed Encryption Key (CMEK).",
            "remedies": [
                "Configure disk_encryption_key.kms_key_name using a valid Cloud KMS key."
            ]
        },
        {
            "condition": "disk_encryption_key.kms_key_name must be configured.",
            "attribute_path": ["disk_encryption_key", 0, "kms_key_name"],
            "values": [""],
            "policy_type": "blacklist"
        },
        {
            "condition": "disk_encryption_key.kms_key_name must match the CMEK structural pattern.",
            "attribute_path": ["disk_encryption_key", 0, "kms_key_name"],
            "values": ["^projects/.*/locations/.*/keyRings/.*/cryptoKeys/.*$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details