package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scaling_schedules_schedule

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "A scaling schedule's schedule field is empty or unset, meaning it will fail to trigger at the intended time and leave the group under-provisioned during expected demand.",
            "remedies": [
                "Set schedule to a valid, tested cron expression.",
                "Validate the cron expression against expected demand patterns.",
                "Avoid leaving schedule blank or malformed."
            ]
        },
        {
            "condition": "Check if schedule is explicitly set",
            "attribute_path": ["autoscaling_policy", 0, "scaling_schedules", 0, "schedule"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
