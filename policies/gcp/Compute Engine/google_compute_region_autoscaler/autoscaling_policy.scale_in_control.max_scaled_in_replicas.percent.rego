package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_scale_in_control_max_scaled_in_replicas_percent

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's max_scaled_in_replicas percent is unbounded or too high, risking removal of the entire managed instance group in a single scale-in event.",
            "remedies": [
                "Set max_scaled_in_replicas.percent to a sensible cap.",
                "Avoid allowing scale-in of the entire instance group at once.",
                "Base the percentage on acceptable capacity loss during scale-in."
            ]
        },
        {
            "condition": "Check if max_scaled_in_replicas percent is within an acceptable range",
            "attribute_path": ["autoscaling_policy", 0, "scale_in_control", 0, "max_scaled_in_replicas", 0, "percent"],
            "values": [1, 50],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
