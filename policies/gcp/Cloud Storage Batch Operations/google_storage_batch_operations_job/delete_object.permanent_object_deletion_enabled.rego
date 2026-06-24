package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.delete_object_permanent_object_deletion_enabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "Permanent object deletion is enabled",
        "remedies": [
            "Set permanent_object_deletion_enabled to false",
            "Use soft delete to allow recovery of objects"
        ]
    },
        {
            "condition": "permanent_object_deletion_enabled must not be true",
            "attribute_path": ["delete_object", 0, "permanent_object_deletion_enabled"],
            "policy_type": "blacklist",
            "values": [true]
        }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
