package terraform.gcp.security.compute_engine.google_compute_region_security_policy.type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Compute Region Security Policy is not configured for the approved network-layer protection type.",
            "remedies": [
                "Set type to 'CLOUD_ARMOR_NETWORK'."
            ]
        },
        {
            "condition": "Security policy type must be CLOUD_ARMOR_NETWORK",
            "attribute_path": ["type"],
            "values": ["CLOUD_ARMOR_NETWORK"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details