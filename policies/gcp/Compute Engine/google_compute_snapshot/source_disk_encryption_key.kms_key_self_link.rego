package terraform.gcp.security.compute_engine.google_compute_snapshot.source_disk_encryption_key_kms_key_self_link
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "No customer-managed key is set for the source disk",
            "remedies": ["Set kms_key_self_link to the customer-managed KMS key protecting the source disk"]
        },
        {
            "condition": "kms_key_self_link is set",
            "attribute_path": ["source_disk_encryption_key", 0, "kms_key_self_link"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details