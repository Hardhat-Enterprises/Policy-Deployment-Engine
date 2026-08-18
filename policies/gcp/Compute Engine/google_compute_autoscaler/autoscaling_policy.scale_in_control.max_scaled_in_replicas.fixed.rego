package terraform.gcp.security.compute_engine.google_compute_autoscaler.autoscaling_policy_scale_in_control_max_scaled_in_replicas_fixed
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "Fixed value is set to too high of a value which can cause stability issues",
            "remedies": ["Set fixed value to 1 in max_scaled_in_replicas" ]
        },
        {
            "condition": "Test to see if fixed value is 1",
            "attribute_path": ["autoscaling_policy", 0, "scale_in_control", 0, "max_scaled_in_replicas", 0, "fixed"],
            "values": [null, 1],
            "policy_type": "range"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details