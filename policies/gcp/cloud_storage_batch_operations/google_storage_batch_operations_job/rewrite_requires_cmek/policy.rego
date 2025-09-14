package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.rewrite_requires_cmek

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "rewrite_object must use a valid CMEK",
        "remedies": [
            "Set kms_key to a valid CMEK path",
            "Use format: projects/*/locations/*/keyRings/*/cryptoKeys/*"
        ]
    },
    {
        "condition": "kms_key must not be empty",
        "attribute_path": ["rewrite_object", 0, "kms_key"],
        "values": [null, ""],
        "policy_type": "blacklist"
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
