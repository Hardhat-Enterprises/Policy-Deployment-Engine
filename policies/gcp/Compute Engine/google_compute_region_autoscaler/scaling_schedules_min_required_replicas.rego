package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.scaling_schedules_min_required_replicas

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "A scaling schedule's min_required_replicas is set to 0 or too low, risking the group being under-provisioned during a scheduled high-demand window.",
            "remedies": [
                "Set min_required_replicas to a sensible non-zero value.",
                "Base the value on expected peak demand during the scheduled window.",
                "Avoid leaving min_required_replicas at 0 for active schedules."
            ]
        },
        {
            "condition": "Check if min_required_replicas is within an acceptable range",
            "attribute_path": ["autoscaling_policy", "scaling_schedules", "min_required_replicas"],
            "values": [1, 20],
            "policy_type": "Range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
