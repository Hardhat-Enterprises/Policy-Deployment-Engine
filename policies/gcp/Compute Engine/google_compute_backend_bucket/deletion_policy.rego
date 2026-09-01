package terraform.gcp.security.compute_engine.google_compute_backend_bucket.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_bucket.vars

conditions := [
    [
        {
            "situation_description": "The Backend Bucket is not protected from accidental deletion.",
            "remedies": [
                "Set deletion_policy = PREVENT."
            ]
        },
        {
            "condition": "Backend Bucket deletion protection must be enabled.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details