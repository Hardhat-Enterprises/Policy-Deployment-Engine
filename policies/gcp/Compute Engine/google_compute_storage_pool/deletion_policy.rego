package terraform.gcp.security.compute_engine.google_compute_storage_pool.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Pool deletion policy allows the resource to be deleted",
            "remedies": [
                "Set deletion_policy to PREVENT to prevent Terraform from destroying the Storage Pool"
            ]
        },
        {
            "condition": "deletion_policy must prevent deletion",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details