package terraform.gcp.security.compute_engine.google_compute_target_instance.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_instance.vars

conditions := [
    [
        {
            "situation_description": "Target Instance is deployed outside the approved zone",
            "remedies": [
                "Set zone to australia-southeast1-a"
            ]
        },
        {
            "condition": "Zone must use the approved deployment zone",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
