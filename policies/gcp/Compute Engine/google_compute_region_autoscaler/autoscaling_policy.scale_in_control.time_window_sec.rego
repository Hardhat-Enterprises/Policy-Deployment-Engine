package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scale_in_control_time_window_sec

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's scale_in_control time_window_sec is too low, causing scale-in decisions to be based on a narrow, recent load snapshot and risking premature scale-in.",
            "remedies": [
                "Set time_window_sec to a sensible minimum to smooth scale-in decisions.",
                "Base the value on realistic short-term load fluctuation patterns.",
                "Avoid setting time_window_sec too low to save on compute cost."
            ]
        },
        {
            "condition": "Check if time_window_sec is within an acceptable range",
            "attribute_path": ["autoscaling_policy", 0, "scale_in_control", 0, "time_window_sec"],
            "values": [60, 3600],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
