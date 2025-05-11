package terraform.gcp.security.storage.bucket.storage_class_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket uses cold storage class which is blacklisted for critical workloads.",
            "remedies": ["Set storage_class to STANDARD or MULTI_REGIONAL"]
        },
        {
            "condition": "Disallow cold storage classes",
            "attribute_path": ["storage_class"],
            "values": ["NEARLINE", "COLDLINE", "ARCHIVE"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
