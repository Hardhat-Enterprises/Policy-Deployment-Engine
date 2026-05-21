package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.include_prefixes_required

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job does not restrict transfer scope with include_prefixes.",
            "remedies": [
                "Set object_conditions.include_prefixes to limit which objects are transferred."
            ]
        },
        {
            "condition": "Check that include_prefixes is configured.",
            "attribute_path": ["transfer_spec", 0, "object_conditions", 0, "include_prefixes", 0],
            "values": ["secure-data/"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details