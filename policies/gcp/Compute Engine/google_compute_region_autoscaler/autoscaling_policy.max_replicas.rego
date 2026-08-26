package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_max_replicas

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's max_replicas is not capped to a reasonable value, risking unbounded scale-out and a Denial-of-Wallet cost spike during a traffic surge.",
            "remedies": [
                "Set max_replicas to a reasonable, capped value.",
                "Base the cap on realistic peak load and budget constraints.",
                "Review max_replicas periodically as workload requirements change."
            ]
        },
        {
            "condition": "Check if max_replicas is within an acceptable range",
            "attribute_path": ["autoscaling_policy", 0, "max_replicas"],
            "values": [1, 20],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
