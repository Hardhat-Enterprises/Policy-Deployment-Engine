package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_cooldown_period

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's cooldown_period is too short, causing it to collect metrics from instances still initializing and make unreliable scaling decisions.",
            "remedies": [
                "Set cooldown_period to a value matching realistic instance startup time.",
                "Test how long an instance takes to initialize before setting this value.",
                "Avoid leaving cooldown_period below a safe minimum."
            ]
        },
        {
            "condition": "Check if cooldown_period is within an acceptable range",
            "attribute_path": ["autoscaling_policy", 0, "cooldown_period"],
            "values": [60, 600],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
