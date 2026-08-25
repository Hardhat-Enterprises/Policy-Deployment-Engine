package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scaling_schedules_duration_sec

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "A scaling schedule's duration_sec is too short, risking the schedule ending before the actual demand window passes and causing premature scale-down.",
            "remedies": [
                "Set duration_sec to adequately cover the intended demand window.",
                "Base the value on realistic historical demand patterns.",
                "Avoid setting duration_sec at the bare technical minimum."
            ]
        },
        {
            "condition": "Check if duration_sec is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "scaling_schedules", "duration_sec"],
            "values": [1800, 86400],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
