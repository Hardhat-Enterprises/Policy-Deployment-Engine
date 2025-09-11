package terraform.gcp.security.cloud_storage.google_storage_bucket.public_access_prevention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket does not have public access prevention enabled.",
            "remedies": ["Set public_access_prevention to 'enforced'"]
        },
        {
            "condition": "Check if public_access_prevention is enforced.",
            "attribute_path": ["public_access_prevention"],
            "values": ["enforced"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
