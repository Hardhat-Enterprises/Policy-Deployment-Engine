package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.scaling_schedules_disabled

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "A scaling schedule's disabled flag is set to true, meaning the schedule has no effect and the group will not scale during the intended demand window.",
            "remedies": [
                "Set disabled to false for active scaling schedules.",
                "Review scaling schedules regularly to confirm they are enabled as intended.",
                "Avoid leaving scaling schedules unintentionally disabled."
            ]
        },
        {
            "condition": "Check if scaling schedule is enabled",
            "attribute_path": ["autoscaling_policy", "scaling_schedules", "disabled"],
            "values": [true],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
