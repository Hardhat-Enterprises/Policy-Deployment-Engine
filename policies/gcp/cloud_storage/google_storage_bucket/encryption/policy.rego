package terraform.gcp.security.cloud_storage.google_storage_bucket.encryption

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "Encryption is recommended for security.",
            "remedies": ["Enable encryption"]
        },
        {
            "condition": "Encryption is disabled.",
            "attribute_path": ["encryption",0,"default_kms_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
