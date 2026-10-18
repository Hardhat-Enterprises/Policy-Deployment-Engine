package terraform.gcp.security.compute_engine.google_compute_region_disk.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Regional disks should only be deployed in an approved region.",
            "remedies": [
                "Set region to us-central1."
            ]
        },
        {
            "condition": "Require an approved region for the regional disk.",
            "attribute_path": ["region"],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details