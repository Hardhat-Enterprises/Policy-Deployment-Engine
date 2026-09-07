package terraform.gcp.security.compute_engine.google_compute_backend_bucket_signed_url_key.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_bucket_signed_url_key.vars

conditions := [
    [
        {
            "situation_description": "Backend Bucket Signed URL Key may be abandoned and left outside Terraform management",
            "remedies": [
                "Use DELETE for normal teardown or PREVENT when retention is required; do not use ABANDON"
            ]
        },
        {
            "condition": "Deletion policy must not leave the signed URL key unmanaged",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
