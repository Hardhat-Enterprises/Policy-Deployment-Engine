package terraform.gcp.security.compute_engine.google_compute_autoscaler.google_compute_autoscaler.autoscaling_policy_scale_in_control_max_scaled_in_replicas_percent
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "Percentage is set to too high of a value",
            "remedies": ["Set percentage to a value less that 15%"]
        },
        {
            "condition": "Test to see if percentage is set to at least 15% or lower",
            "attribute_path": ["autoscaling_policy", 0, "scale_in_control", 0, "max_scaled_in_replicas", 0, "percent"],
            "values": [1, 16],
            "policy_type": "range"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details