package terraform.gcp.security.compute_engine.google_compute_region_disk.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Regional disks should be deployed only in the approved region.",
            "remedies": [
                "Set region to us-central1."
            ]
        },
        {
            "condition": "Require an approved disk region.",
            "attribute_path": ["region"],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details