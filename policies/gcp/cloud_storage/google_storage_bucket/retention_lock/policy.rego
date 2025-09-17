package terraform.gcp.security.cloud_storage.google_storage_bucket.retention_lock

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "Locking a bucket is an irreversible action.",
            "remedies": ["Avoid using islock for retention as it is irreversible"]
        },
        {
            "condition": "Retention lock should be false.",
            "attribute_path": ["retention_policy", 0, "is_locked"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
