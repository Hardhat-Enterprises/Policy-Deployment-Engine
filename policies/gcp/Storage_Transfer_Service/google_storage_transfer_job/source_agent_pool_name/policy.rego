package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.source_agent_pool_name

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job is not using an approved source agent pool.",
            "remedies": [
                "Set transfer_spec.source_agent_pool_name to an approved agent pool.",
                "Use a controlled agent pool for transfer jobs."
            ]
        },
        {
            "condition": "Storage Transfer job must use an approved source agent pool.",
            "attribute_path": ["transfer_spec", 0, "source_agent_pool_name"],
            "values": vars.variables.approved_source_agent_pool_names,
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details