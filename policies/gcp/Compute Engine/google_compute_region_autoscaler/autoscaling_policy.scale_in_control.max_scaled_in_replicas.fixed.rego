package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scale_in_control_max_scaled_in_replicas_fixed

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's max_scaled_in_replicas fixed value is unset or too high, risking removal of a large number of instances in a single scale-in event.",
            "remedies": [
                "Set max_scaled_in_replicas.fixed to a sensible cap on scale-in size.",
                "Base the value on how many instances can safely be removed at once.",
                "Avoid leaving max_scaled_in_replicas.fixed unset."
            ]
        },
        {
            "condition": "Check if max_scaled_in_replicas fixed is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "scale_in_control", "max_scaled_in_replicas", "fixed"],
            "values": [1, 5],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
