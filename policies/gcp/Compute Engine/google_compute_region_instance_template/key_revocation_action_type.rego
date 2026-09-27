package terraform.gcp.security.compute_engine.google_compute_region_instance_template.key_revocation_action_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Region Instance Template does not prevent destructive deletion",
            "remedies": [
                "Set deletion_policy to PREVENT"
            ]
        },
        {
            "condition": "Deletion policy must prevent resource destruction",
            "attribute_path": ["key_revocation_action_type"],
            "values": ["STOP"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
