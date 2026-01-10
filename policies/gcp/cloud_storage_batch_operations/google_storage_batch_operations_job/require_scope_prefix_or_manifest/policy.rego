package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.require_scope_prefix_or_manifest

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "Job is unscoped (no prefixes and no manifest)",
        "remedies": [
            "Add prefix_list with included_object_prefixes",
            "Or add manifest with manifest_location"
        ]
    },
    {
        "condition": "included_object_prefixes must not be empty or contain empty strings",
        "attribute_path": ["bucket_list", 0, "buckets", 0, "prefix_list", 0, "included_object_prefixes"],
        "policy_type": "blacklist",
        "values": [null, ""]
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
