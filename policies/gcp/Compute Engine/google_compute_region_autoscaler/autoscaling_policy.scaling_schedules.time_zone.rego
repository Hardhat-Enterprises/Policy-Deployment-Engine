package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scaling_schedules_time_zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "A scaling schedule's time_zone is empty or unset, meaning the schedule may trigger at the wrong actual time relative to real demand patterns.",
            "remedies": [
                "Explicitly set time_zone to a valid tz-database timezone.",
                "Confirm the timezone matches where demand actually occurs.",
                "Avoid leaving time_zone blank."
            ]
        },
        {
            "condition": "Check if time_zone is explicitly set",
            "attribute_path": ["autoscaling_policy", 0, "scaling_schedules", 0, "time_zone"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
