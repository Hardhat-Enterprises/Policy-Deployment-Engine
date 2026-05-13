package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.delete_objects_from_source_after_transfer

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job deletes objects from the source after transfer.",
            "remedies": [
                "Set transfer_spec.transfer_options.delete_objects_from_source_after_transfer to false.",
                "Use a copy-based transfer instead of deleting source data automatically."
            ]
        },
        {
            "condition": "Storage Transfer job must not delete objects from the source after transfer.",
            "attribute_path": ["transfer_spec", 0, "transfer_options", 0, "delete_objects_from_source_after_transfer"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
