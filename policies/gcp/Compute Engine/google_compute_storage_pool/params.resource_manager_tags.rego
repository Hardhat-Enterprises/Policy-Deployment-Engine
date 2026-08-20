package terraform.gcp.security.compute_engine.google_compute_storage_pool.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Pool does not have the required security Resource Manager tag",
            "remedies": [
                "Add the approved Resource Manager security tag to the Storage Pool"
            ]
        },
        {
            "condition": "Resource Manager tags must include the approved security tag",
            "attribute_path": ["params", 0, "resource_manager_tags"],
            "values": [
                {
                    "pde-project-vindya/security": "required"
                }
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details