package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_metric_target

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's metric target is set too high, delaying scale-out and risking service degradation under load.",
            "remedies": [
                "Set metric.target to a value that leaves adequate scaling headroom.",
                "Base the value on realistic workload thresholds.",
                "Avoid setting metric.target above a safe upper bound."
            ]
        },
        {
            "condition": "Check if metric target is within an acceptable range",
            "attribute_path": ["autoscaling_policy", 0, "metric", 0, "target"],
            "values": [1, 1000],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
