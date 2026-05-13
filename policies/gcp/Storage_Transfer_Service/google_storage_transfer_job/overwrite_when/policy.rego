package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.overwrite_when

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job is configured to always overwrite objects in the destination.",
            "remedies": [
                "Set overwrite_when to a safer value.",
                "Avoid unconditional overwriting of destination objects."
            ]
        },
        {
            "condition": "Storage Transfer job must not always overwrite destination objects.",
            "attribute_path": ["transfer_spec", 0, "transfer_options", 0, "overwrite_when"],
            "values": ["ALWAYS"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details