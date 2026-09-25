package terraform.gcp.security.compute_engine.google_compute_region_disk.disk_encryption_key_raw_key

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "A raw customer-supplied encryption key is defined directly in Terraform.",
            "remedies": [
                "Remove the raw encryption key and manage disk encryption through Cloud KMS."
            ]
        },
        {
            "condition": "Raw encryption key material should not be defined directly.",
            "attribute_path": ["disk_encryption_key", 0, "raw_key"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details