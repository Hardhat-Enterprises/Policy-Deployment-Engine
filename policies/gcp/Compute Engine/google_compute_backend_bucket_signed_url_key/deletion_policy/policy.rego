package terraform.gcp.security.compute_engine.google_compute_backend_bucket_signed_url_key.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_bucket_signed_url_key.vars

conditions := [
    [
        {
            "situation_description": "Backend Bucket Signed URL Key may remain unmanaged when deletion_policy is set to ABANDON",
            "remedies": [
                "Use DELETE for intentional teardown or PREVENT when retention is required; do not use ABANDON"
            ]
        },
        {
            "condition": "Deletion policy must not abandon the signed URL key outside Terraform management",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
