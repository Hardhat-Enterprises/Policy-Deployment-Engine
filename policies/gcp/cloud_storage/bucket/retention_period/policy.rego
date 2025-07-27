package terraform.gcp.security.cloud_storage.bucket.retention_period

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket retention period is not within the allowed range.",
            "remedies": ["Set retention_period between 604800 (7 days) and 2592000 (30 days)"]
        },
        {
            "condition": "Retention must be within 7 to 30 days.",
            "attribute_path": ["retention_policy", 0, "retention_period"],
            "values": [604800, 2592000],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
