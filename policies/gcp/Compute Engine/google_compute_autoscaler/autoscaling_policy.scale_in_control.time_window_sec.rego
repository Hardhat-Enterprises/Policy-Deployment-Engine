package terraform.gcp.security.compute_engine.google_compute_autoscaler.autoscaling_policy_scale_in_control_time_window_sec
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "time_window_sec set to a too low of a value for scaling down",
            "remedies": [ "Set time_window_sec to at least 120 seconds to ensure that enough time is given to scale down"]
        },
        {
            "condition": "Set time_window_sec to at least 120 seconds",
            "attribute_path": ["autoscaling_policy", 0, "scale_in_control", 0, "time_window_sec"],
            "values": [119, 400],
            "policy_type": "range"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details