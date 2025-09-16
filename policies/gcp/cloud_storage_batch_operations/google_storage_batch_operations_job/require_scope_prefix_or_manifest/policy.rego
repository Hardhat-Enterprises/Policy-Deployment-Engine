package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.require_scope_prefix_or_manifest

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [
    [
        {
            "situation_description": "Job is unscoped (no prefixes and no manifest)",
            "remedies": [
                "Add prefix_list with included_object_prefixes",
                "Or add manifest with manifest_location"
            ]
        },
        {
            "condition": "first prefix element must not be null",
            "attribute_path": ["bucket_list", 0, "buckets", 0, "prefix_list", 0, "included_object_prefixes", 0],
            "policy_type": "blacklist",
            "values": [null]
        }
    ],
    [
        {
            "situation_description": "Job is unscoped (no prefixes and no manifest)",
            "remedies": [
                "Add prefix_list with included_object_prefixes",
                "Or add manifest with manifest_location"
            ]
        },
        {
            "condition": "first prefix element must not be empty",
            "attribute_path": ["bucket_list", 0, "buckets", 0, "prefix_list", 0, "included_object_prefixes", 0],
            "policy_type": "blacklist",
            "values": [""]
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
