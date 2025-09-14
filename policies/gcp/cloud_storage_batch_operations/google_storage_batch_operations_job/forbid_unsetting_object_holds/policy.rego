package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.forbid_unsetting_object_holds

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "Batch unsets object holds",
        "remedies": [
            "Set event_based_hold to true",
            "Set temporary_hold to true",
            "Or omit put_object_hold block entirely"
        ]
    },
    {
        "condition": "event_based_hold must not be false",
        "attribute_path": ["put_object_hold", 0, "event_based_hold"],
        "values": ["UNSET"],
        "policy_type": "blacklist"
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
