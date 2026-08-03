package terraform.gcp.security.compute_engine.google_compute_snapshot.source_disk_encryption_key_raw_key

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "Raw key material for the source disk is written directly into the Terraform configuration,\\",
            "remedies": ["Remove raw_key and use kms_key_self_link to reference a key held in Cloud KMS instead"]
        },
        {
            "condition": "raw_key is not set",
            "attribute_path": ["source_disk_encryption_key", 0, "raw_key"],
            "values": [null, ""],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details