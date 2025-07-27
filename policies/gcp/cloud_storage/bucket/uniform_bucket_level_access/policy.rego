package terraform.gcp.security.cloud_storage.bucket.uniform_bucket_level_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Uniform bucket-level access is not enabled, which can lead to inconsistent access control.",
            "remedies": ["Enable uniform_bucket_level_access for consistent permissions."]
        },
        {
            "condition": "Check if uniform_bucket_level_access is enabled.",
            "attribute_path": ["uniform_bucket_level_access"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
