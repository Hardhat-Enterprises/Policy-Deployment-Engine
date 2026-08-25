package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.stabilization_period

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's stabilization_period is too low, causing premature scale-in based on short-term load dips and risking an availability failure if load returns quickly.",
            "remedies": [
                "Set stabilization_period to a sensible minimum value.",
                "Base the value on realistic load fluctuation patterns.",
                "Avoid setting stabilization_period too low to save on compute cost."
            ]
        },
        {
            "condition": "Check if stabilization_period is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "stabilization_period"],
            "values": [60, 3600],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
