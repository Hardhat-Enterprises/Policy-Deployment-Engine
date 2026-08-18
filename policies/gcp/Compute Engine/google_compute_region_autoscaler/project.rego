package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.project

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's project is left unset, risking deployment into the wrong or a less-restricted default project.",
            "remedies": [
                "Explicitly set project on the google_compute_region_autoscaler resource.",
                "Avoid relying on the provider's default project context.",
                "Confirm the correct project ID before deployment."
            ]
        },
        {
            "condition": "Check if project is explicitly set",
            "attribute_path": ["project"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
