package terraform.gcp.security.cloud_storage.google_storage_bucket.uniform_bucket_level_access

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket does not enforce uniform bucket-level access.",
            "remedies": ["Set uniform_bucket_level_access to true."]
        },
        {
            "condition": "Uniform bucket-level access must be enabled.",
            "attribute_path": ["uniform_bucket_level_access"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
