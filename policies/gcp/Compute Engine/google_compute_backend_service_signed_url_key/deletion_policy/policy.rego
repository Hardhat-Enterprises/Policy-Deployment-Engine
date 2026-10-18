package terraform.gcp.security.compute_engine.google_compute_backend_service_signed_url_key.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_service_signed_url_key.vars

conditions := [
    [
        {
            "situation_description": "Backend Service Signed URL Key is not protected from Terraform deletion",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the signed URL key from unintended destruction"
            ]
        },
        {
            "condition": "Deletion policy must prevent Terraform from destroying the signed URL key",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details