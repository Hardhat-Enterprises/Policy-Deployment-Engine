package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's region is not restricted to an approved list, risking deployment outside allowed data-residency boundaries.",
            "remedies": [
                "Restrict region to an approved-region whitelist.",
                "Confirm data residency requirements before choosing a region.",
                "Update the allowed region list as organisational policy changes."
            ]
        },
        {
            "condition": "Check if region is within the approved whitelist",
            "attribute_path": ["region"],
            "values": ["us-central1", "us-east1", "australia-southeast1"],
            "policy_type": "Whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
