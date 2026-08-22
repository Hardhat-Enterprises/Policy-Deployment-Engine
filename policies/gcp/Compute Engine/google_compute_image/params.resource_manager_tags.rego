package terraform.gcp.security.compute_engine.google_compute_image.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image does not have an approved environment Resource Manager tag.",
            "remedies": [
                "Set params.resource_manager_tags tagKeys/env to an approved value: tagValues/dev, tagValues/test, or tagValues/prod."
            ]
        },
        {
            "condition": "The environment Resource Manager tag must use an approved value.",
            "attribute_path": ["params", 0, "resource_manager_tags", "tagKeys/env"],
            "values": ["tagValues/dev", "tagValues/test", "tagValues/prod"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details