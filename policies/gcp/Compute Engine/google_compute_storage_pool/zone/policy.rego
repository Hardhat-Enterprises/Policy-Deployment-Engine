package terraform.gcp.security.compute_engine.google_compute_storage_pool.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Pool is located outside the approved zone",
            "remedies": [
                "Move the Storage Pool to an approved zone"
            ]
        },
        {
            "condition": "Storage Pool zone must be in the approved zone list",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details