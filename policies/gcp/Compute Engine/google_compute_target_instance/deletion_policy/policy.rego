package terraform.gcp.security.compute_engine.google_compute_target_instance.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_instance.vars

conditions := [
    [
        {
            "situation_description": "Target Instance does not prevent destructive deletion",
            "remedies": [
                "Set deletion_policy to PREVENT"
            ]
        },
        {
            "condition": "Deletion policy must prevent resource destruction",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
