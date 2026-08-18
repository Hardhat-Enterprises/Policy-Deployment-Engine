package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.target

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's target is empty or unset, meaning it has no valid managed instance group to scale, or risks pointing to an unintended resource.",
            "remedies": [
                "Explicitly set target to the intended managed instance group's URL.",
                "Verify the referenced instance group belongs to the correct project and workload.",
                "Avoid leaving target blank or pointing to a placeholder resource."
            ]
        },
        {
            "condition": "Check if target is explicitly set",
            "attribute_path": ["target"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
