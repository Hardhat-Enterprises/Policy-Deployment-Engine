package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.mode

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's mode is set to OFF, leaving the instance group fixed in size and unable to scale during a traffic spike.",
            "remedies": [
                "Set mode to ON so the autoscaler remains active.",
                "Use ONLY_UP as a minimum if scale-in must be controlled manually.",
                "Avoid disabling autoscaling via mode unless intentionally required."
            ]
        },
        {
            "condition": "Check if mode is set to an active value",
            "attribute_path": ["autoscaling_policy", "mode"],
            "values": ["ON", "ONLY_UP"],
            "policy_type": "Whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
