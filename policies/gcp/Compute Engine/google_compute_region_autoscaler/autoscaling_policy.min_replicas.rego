package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_min_replicas

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's min_replicas is set to 0, allowing the group to scale down to zero running instances and causing an availability outage.",
            "remedies": [
                "Set min_replicas to at least 1.",
                "Ensure a baseline of running instances is always maintained.",
                "Review min_replicas against expected minimum load."
            ]
        },
        {
            "condition": "Check if min_replicas is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "min_replicas"],
            "values": [1, 20],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
