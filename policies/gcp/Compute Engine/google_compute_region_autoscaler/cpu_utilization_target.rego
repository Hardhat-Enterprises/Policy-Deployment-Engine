package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.cpu_utilization_target

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's cpu_utilization target is set too close to 1.0, leaving little headroom to react before instances become overloaded during a traffic burst.",
            "remedies": [
                "Set cpu_utilization target to a value that preserves scaling headroom.",
                "Avoid setting the target above a safe upper bound.",
                "Review the target against realistic burst traffic patterns."
            ]
        },
        {
            "condition": "Check if cpu_utilization target is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "cpu_utilization", "target"],
            "values": [0.1, 0.85],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
