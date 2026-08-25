package terraform.gcp.security.compute_engine.google_compute_disk.disk_encryption_key_raw_key

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars

conditions := [
    [
        {
            "situation_description": "Compute disk uses a raw customer-supplied encryption key (CSEK), which persists in Terraform state as plaintext and creates a key-exposure risk.",
            "remedies": ["Remove disk_encryption_key.raw_key and use disk_encryption_key.kms_key_self_link (CMEK) instead."]
        },
        {
            "condition": "disk_encryption_key.raw_key must not be set.",
            "attribute_path": ["disk_encryption_key", 0, "raw_key"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details