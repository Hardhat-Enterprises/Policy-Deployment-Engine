package terraform.gcp.security.storage.bucket.storage_class_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket uses a storage class that is not approved for critical workloads.",
            "remedies": ["Set storage_class to STANDARD or MULTI_REGIONAL"]
        },
        {
            "condition": "Only allow STANDARD or MULTI_REGIONAL storage classes",
            "attribute_path": ["storage_class"],
            "values": ["STANDARD", "MULTI_REGIONAL"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
