package terraform.gcp.security.compute_engine.google_compute_storage_pool.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Pool does not have deletion protection enabled",
            "remedies": [
                "Set deletion_protection to true to prevent accidental storage-pool deletion"
            ]
        },
        {
            "condition": "deletion_protection must be enabled",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details