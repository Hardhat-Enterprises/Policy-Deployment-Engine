package terraform.gcp.security.compute_engine.google_compute_disk.disk_encryption_key_rsa_encrypted_key

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars

conditions := [
    [
        {
            "situation_description": "Compute disk uses an RSA-wrapped customer-supplied encryption key (CSEK), which is still a customer-managed secret that appears in Terraform state and creates a key-exposure risk.",
            "remedies": ["Remove disk_encryption_key.rsa_encrypted_key and use disk_encryption_key.kms_key_self_link (CMEK) instead."]
        },
        {
            "condition": "disk_encryption_key.rsa_encrypted_key must not be set.",
            "attribute_path": ["disk_encryption_key", 0, "rsa_encrypted_key"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details