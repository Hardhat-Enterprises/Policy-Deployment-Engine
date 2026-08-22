package terraform.gcp.security.compute_engine.google_compute_image.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "Compute Image must be protected from accidental deletion.",
            "remedies": ["Set deletion_policy = PREVENT."]
        },
        {
            "condition": "deletion_policy must be PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details