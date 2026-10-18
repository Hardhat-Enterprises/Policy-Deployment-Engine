package terraform.gcp.security.compute_engine.google_compute_region_disk.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Regional disks should be protected from accidental deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "Require deletion protection for the regional disk.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details