package terraform.gcp.security.compute_engine.google_compute_snapshot.snapshot_encryption_key_kms_key_self_link
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "The snapshot is encrypted with a KMS key that is not on the organisation's approved list, so control over who can decrypt the data is uncertain",
            "remedies": ["Set kms_key_self_link to an approved KMS key. The approved set is an example list the organisation defines"]
        },
        {
            "condition": "kms_key_self_link is an approved KMS key",
            "attribute_path": ["snapshot_encryption_key", 0, "kms_key_self_link"],
            "values": [null,""],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details