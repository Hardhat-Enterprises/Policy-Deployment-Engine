package terraform.gcp.security.google_alloydb_instance.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should prevent accidental or unauthorized deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Enable Terraform deletion protection for the AlloyDB instance."
            ]
        },
        {
            "condition": "The deletion_policy attribute must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": [
                "PREVENT"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details