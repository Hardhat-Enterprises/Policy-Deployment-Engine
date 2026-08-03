package terraform.gcp.security.compute_engine.google_compute_snapshot.snapshot_encryption_key_raw_key
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "raw key material is written directly into the Terraform configuration, exposing the secret in config files, state, and version control",
            "remedies": ["remove raw_key and use kms_key_self_link to reference a key held in Cloud KMS instead"]
        },
        {
            "condition": "raw_key is not set",
            "attribute_path": ["snapshot_encryption_key", 0, "raw_key"],
            "values": [null, ""],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details