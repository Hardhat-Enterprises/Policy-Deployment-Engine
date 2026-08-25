package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_metric_single_instance_assignment

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's single_instance_assignment is set too high, causing under-provisioning relative to actual per-instance workload capacity and risking overloaded instances.",
            "remedies": [
                "Set single_instance_assignment to a realistic per-instance capacity value.",
                "Base the value on tested per-instance throughput.",
                "Avoid setting single_instance_assignment above a safe upper bound."
            ]
        },
        {
            "condition": "Check if single_instance_assignment is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "metric", "single_instance_assignment"],
            "values": [1, 500],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
