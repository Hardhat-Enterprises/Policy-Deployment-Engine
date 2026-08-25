package terraform.gcp.security.compute_engine.google_compute_disk.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars

conditions := [
    [
        {
            "situation_description": "Compute disk is missing a governance-mandated resource manager tag that drives IAM conditions and organisation-policy enforcement.",
            "remedies": ["Set params.resource_manager_tags to include an approved data-classification tag key/value."]
        },
        {
            "condition": "params.resource_manager_tags must include an approved data-classification tag.",
            "attribute_path": ["params", 0, "resource_manager_tags", "tagKeys/data-classification"],
            "values": ["tagValues/confidential", "tagValues/internal", "tagValues/public"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details